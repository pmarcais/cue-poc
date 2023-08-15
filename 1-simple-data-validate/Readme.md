## Step 1: Generate a CUE data model from a YAMl data model

Let's assume we have an existing data model written in YAML. We can convert this set of data to a CUE data model.

```console
➜  cue-poc touch data-example.cue
➜  cue import data-example.yml data-example.cue --force
```

<table>
<tr>
<td> YAML </td> <td> CUE </td>
</tr>
<tr>
<td>

```yaml
 network:
  - hostname: Host1
    interface:
      - l0:
          ipv4Addr: [10.0.1.1, 192.168.0.1]
          ipv6Addr: [c0d1::1]
    asn: 65001

  - hostname: Host2
    interface:
      - l0:
          ipv4Addr: [10.0.1.2, 192.168.0.2]
          ipv6Addr: [c0d1::2]
    asn: 65002





```

</td>
<td>

```
network: [{
    hostname: "Host1"
    interface: [{
        l0: {
            ipv4Addr: ["10.0.1.1", "192.168.0.1"]
            ipv6Addr: ["c0d1::1"]
        }
    }]
    asn: 65001
}, {
    hostname: "Host2"
    interface: [{
        l0: {
            ipv4Addr: ["10.0.1.2", "192.168.0.2"]
            ipv6Addr: ["c0d1::2"]
        }
    }]
    asn: 65002
}]
```

</td>
</tr>
</table>

Ideally, the data model could be defined in CUE without writting the YAML version first. Still the YAML version seems more readable than the json-like CUE version 

## Step 2: Validate the data model 

```console
cue vet data-example.cue schema.cue
cue vet data-example.yml schema.cue
``````
No output to those commands means no error in the data model

<table>
<tr>
<td> DATA </td> <td> DATA MODEL/SCHEMA </td>
</tr>
<tr>
<td>

```yaml
 network:
  - hostname: Host1
    interface:
      - l0:
          ipv4Addr: [10.0.1.1, 192.168.0.1]
          ipv6Addr: [c0d1::1]
    asn: 65001

  - hostname: Host2
    interface:
      - l0:
          ipv4Addr: [10.0.1.2, 192.168.0.2]
          ipv6Addr: [c0d1::2]
    asn: 65002





```

</td>
<td>

```
import (
  "net"
)

// Schema itself
#Network: [...{
    hostname: string
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
```

</td>
</tr>

</table>