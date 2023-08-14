package myNetwork

import (
  "net"
)

// Schema itself
#Network: [...{
	hostname: string
	region: string & "amer"|"apac"|"eama"
	interface: [{
		l0: {
			ipv4Addr: [...net.IP]
			ipv6Addr: [...net.IP]
		}
	}]
	asn: >=64512 & <=65534 
}]

// Object to validate
network: #Network