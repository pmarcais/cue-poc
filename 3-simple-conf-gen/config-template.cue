// Configuration Template file

package myNetwork


mytemplate: {
    meta: 
        version: "0.1"
    contents: """

frr version 7.3
frr defaults traditional
hostname {{ .hostname }}
log file /tmp/frr.log
log syslog informational
service integrated-vtysh-config
!
interface enp1s0
 description mgnt
!
interface enp2s0
 description leaf1
!
interface enp3s0
 description leaf2
!
interface lo
 {{- range $i := .interface.l0.ipv4Addr }}
 ip address {{ $i }}/32
 {{- end }}
 {{- range $i := .interface.l0.ipv6Addr }}
 ipv6 address {{ $i }}/128
 {{- end }}
!
router bgp {{ .asn }}
 bgp router-id {{ index .interface.l0.ipv4Addr 0 }}
 bgp bestpath as-path multipath-relax
 neighbor fabric peer-group
 neighbor fabric remote-as external
 neighbor fabric bfd
 neighbor fabric capability extended-nexthop
 neighbor enp2s0 interface peer-group fabric
 neighbor enp3s0 interface peer-group fabric
 !
 address-family ipv4 unicast
  redistribute connected
  neighbor fabric allowas-in
  neighbor fabric route-map bgp_underlay_export out
 exit-address-family
 !
 address-family ipv6 unicast
  redistribute connected
  neighbor fabric activate
  neighbor fabric allowas-in
  neighbor fabric route-map bgp_underlay_export out
 exit-address-family
!
route-map bgp_underlay_export deny 100
!
route-map bgp_underlay_export permit 10
 match interface lo
 match ip address prefix-len 32
 set ip next-hop 0.0.0.1
!
route-map bgp_underlay_export permit 11
 match interface lo
 match ipv6 address prefix-len 128
!
line vty
!
"""
}



//rendered:  {
//    filename: template.Execute(mytemplate.filename, network[index])
//    contents: template.Execute(mytemplate.contents, network[index])
//}

