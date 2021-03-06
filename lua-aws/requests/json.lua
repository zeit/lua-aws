local class = require ('lua-aws.class')
local Request = require ('lua-aws.requests.base')
local Serializer = require ('lua-aws.requests.query_string_serializer')
local util = require ('lua-aws.util')

return class.AWS_JsonRequest.extends(Request) {
	build_request = function (self, req, params)
		local api = self._api
		local target = api:target_prefix()..'.'..self:method_name()
		local version = api:json_version()

		req.path = '/'
		req.headers['Content-Type'] = 'application/x-amz-json-'..version
		req.headers['X-Amz-Target'] = target
		req.body = api:json().encode(params)
		return req
	end,
	
	extract_error = function (self, resp)
		local err = {}

		err.code = resp.headers['x-amzn-ErrorType'] or 'UnknownError'
		if type(err.code) == 'string' then
			err.code = util.split(err.code, ':')[1]
		end

		if #resp.body > 0 then
			local e = self._api:json().decode(resp.body)
			if e.__type or e.code then
				err.code = (util.split(e.__type or e.code, '#'))[1]
			end
			if err.code == 'RequestEntityTooLarge' then
				err.message = 'Request body must be less than 1 MB'
			else
				err.message = e.message or e.Message
			end
		else
			err.code = resp.status
		end
		return err
	end,

	extract_data = function (self, resp) 
		return #resp.body > 0 and self._api:json().decode(resp.body) or {}
  	end,
}
