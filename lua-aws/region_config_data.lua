return {
	rules = {
		["*/*"] = {
			endpoint = "{service}.{region}.amazonaws.com",
		},
		["cn-*/*"] = {
			endpoint = "{service}.{region}.amazonaws.com.cn",
		},
		["*/budgets"] = "globalSSL",
		["*/cloudfront"] = "globalSSL",
		["*/iam"] = "globalSSL",
		["*/sts"] = "globalSSL",
		["*/importexport"] = {
			endpoint = "{service}.amazonaws.com",
			signatureVersion = "v2",
			globalEndpoint = true,
		},
		["*/route53"] = {
			endpoint = "https://{service}.amazonaws.com",
			signatureVersion = "v3https",
			globalEndpoint = true,
		},
		["*/waf"] = "globalSSL",
		["us-gov-*/iam"] = "globalGovCloud",
		["us-gov-*/sts"] = {
			endpoint = "{service}.{region}.amazonaws.com",
		},
		["us-gov-west-1/s3"] = "s3signature",
		["us-west-1/s3"] = "s3signature",
		["us-west-2/s3"] = "s3signature",
		["eu-west-1/s3"] = "s3signature",
		["ap-southeast-1/s3"] = "s3signature",
		["ap-southeast-2/s3"] = "s3signature",
		["ap-northeast-1/s3"] = "s3signature",
		["sa-east-1/s3"] = "s3signature",
		["us-east-1/s3"] = {
			endpoint = "{service}.amazonaws.com",
			signatureVersion = "s3",
		},
		["us-east-1/sdb"] = {
			endpoint = "{service}.amazonaws.com",
			signatureVersion = "v2",
		},
		["*/sdb"] = {
			endpoint = "{service}.{region}.amazonaws.com",
			signatureVersion = "v2",
		},
	},

	patterns = {
		globalSSL = {
			endpoint = "https://{service}.amazonaws.com",
			globalEndpoint = true,
		},
		globalGovCloud = {
			endpoint = "{service}.us-gov.amazonaws.com",
		},
		s3signature = {
			endpoint = "{service}.{region}.amazonaws.com",
			signatureVersion = "s3",
		},
	},
}
