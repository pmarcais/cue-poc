// Configuration Gen script

package myNetwork

import "tool/file"
import "text/template"

name: string @tag(name)

command: "gen": {
    for k, v in network {
        if v.hostname == "\(name)" {        
            "write-\(k)":file.Create & {
                filename: "\(name)-conf.txt"
                contents: template.Execute(mytemplate.contents, network[k])
            }
        }
    }
}