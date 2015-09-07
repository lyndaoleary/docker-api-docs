# API Reference

## List Containers

```json
[
  {
    "Id":"8dfafdbc3a40",
    "Names":[
      "/boring_feynman"
    ],
    "Image":"ubuntu:latest",
    "Command":"echo 1",
    "Created":1367854155,
    "Status":"Exit 0",
    "Ports":[
      {
        "PrivatePort":2222,
        "PublicPort":3333,
        "Type":"tcp"
      }
    ],
    "Labels":{
      "com.example.vendor":"Acme",
      "com.example.license":"GPL",
      "com.example.version":"1.0"
    },
    "SizeRw":12288,
    "SizeRootFs":0
  },
  {
    "Id":"9cd87474be90",
    "Names":[
      "/coolName"
    ],
    "Image":"ubuntu:latest",
    "Command":"echo 222222",
    "Created":1367854155,
    "Status":"Exit 0",
    "Ports":[

    ],
    "Labels":{

    },
    "SizeRw":12288,
    "SizeRootFs":0
  },
]
```

### Usage
`GET /containers/json` 

### Example
`GET /containers/json?all=1&before=8dfafdbc3a40&size=1 HTTP/1.1`

### Query Parameters
|                |              |
-----------------|--------------| 
|**all**         | 1/True/true or 0/False/false, Show all containers. |
|                | **Note:** Only running containers are shown by default (i.e., this defaults to false)|
|**limit**       | Show `limit` last created containers, include non-running ones.|
|**since**       | Show only containers created since Id, include non-running ones. |
|**before**      | Show only containers created before Id, include non-running ones. |
|**size**        | 1/True/true or 0/False/false, Show the containers sizes.|
|**filters**     | a JSON encoded value of the filters (a `map[string][]string`) to process on the containers list. Available filters:`exited=<int>`; -- containers with exit code of  `<int>` ;`status=`(`created`, `restarting`, `running`, `paused`, `exited`)`label=key` or `label="key=value"` of a container label |

### Status Codes
|                |              |
-----------------|--------------| 
**400**        | bad parameter
**500**        | server error

