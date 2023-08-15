// Configuration Data

package myNetwork

network: [{
	hostname: "Host1"
	interface: {
		l0: {
			ipv4Addr: ["10.0.1.1", "192.168.0.1"]
			ipv6Addr: ["c0d1::1"]
		}
	}
	asn: 65001
}, {
	hostname: "Host2"
	interface: {
		l0: {
			ipv4Addr: ["10.0.1.2", "192.168.0.2"]
			ipv6Addr: ["c0d1::2"]
		}
	}
	asn: 65002
}]
