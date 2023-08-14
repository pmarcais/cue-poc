package myNetwork

network: [{
	hostname: "Host3"
	region:   "apac"
	interface: [{
		l0: {
			ipv4Addr: ["10.0.1.3", "192.168.0.3"]
			ipv6Addr: ["c0d1::3"]
		}
	}]
	asn: 65003
}, {
	hostname: "Host4"
	region:   "apac"
	interface: [{
		l0: {
			ipv4Addr: ["10.0.1.4", "192.168.0.4"]
			ipv6Addr: ["c0d1::4"]
		}
	}]
	asn: 65004
}]
