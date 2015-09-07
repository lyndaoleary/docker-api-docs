# API Reference

## List Containers

> Example request

```http
GET /containers/json?all=1&before=8dfafdbc3a40&size=1 HTTP/1.1
Content-Type: application/json
```

```shell
$ curl --unix-socket /var/run/docker.sock http:/containers/json?all=1&before=8dfafdbc3a40&size=1
```

> Example response

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


### Query Parameters
|                |              |
|-----------------|--------------| 
|**all**         | 1/True/true or 0/False/false, Show all containers. |
|                | **Note:** Only running containers are shown by default (i.e., this defaults to false)|
|**limit**       | Show `limit` last created containers, include non-running ones.|
|**since**       | Show only containers created since Id, include non-running ones. |
|**before**      | Show only containers created before Id, include non-running ones. |
|**size**        | 1/True/true or 0/False/false, Show the containers sizes.|
|**filters**     | a JSON encoded value of the filters (a `map[string][]string`) to process on the containers list. Available filters:`exited=<int>`; -- containers with exit code of  `<int>` ;`status=`(`created`, `restarting`, `running`, `paused`, `exited`)`label=key` or `label="key=value"` of a container label |

### Status Codes
|                |              |
|-----------------|--------------| 
**200**        | success
**400**        | bad parameter
**500**        | server error

## Create a container

>Example request

```http
POST /containers/create HTTP/1.1
Content-Type: application/json
{
  "Hostname":"",
  "Domainname":"",
  "User":"",
  "AttachStdin":false,
  "AttachStdout":true,
  "AttachStderr":true,
  "Tty":false,
  "OpenStdin":false,
  "StdinOnce":false,
  "Env":null,
  "Cmd":[
    "date"
  ],
  "Entrypoint":"",
  "Image":"ubuntu",
  "Labels":{
    "com.example.vendor":"Acme",
    "com.example.license":"GPL",
    "com.example.version":"1.0"
  },
  "Mounts":[
    {
      "Source":"/data",
      "Destination":"/data",
      "Mode":"ro,Z",
      "RW":false
    }
  ],
  "WorkingDir":"",
  "NetworkDisabled":false,
  "MacAddress":"12:34:56:78:9a:bc",
  "ExposedPorts":{
    "22/tcp":{
    }
  },
  "HostConfig":{
    "Binds":[
      "/tmp:/tmp"
    ],
    "Links":[
      "redis3:redis"
    ],
    "LxcConf":{
      "lxc.utsname":"docker"
    },
    "Memory":0,
    "MemorySwap":0,
    "KernelMemory":0,
    "CpuShares":512,
    "CpuPeriod":100000,
    "CpusetCpus":"0,1",
    "CpusetMems":"0,1",
    "BlkioWeight":300,
    "MemorySwappiness":60,
    "OomKillDisable":false,
    "PortBindings":{
      "22/tcp":[
        {
          "HostPort":"11022"
        }
      ]
    },
    "PublishAllPorts":false,
    "Privileged":false,
    "ReadonlyRootfs":false,
    "Dns":[
      "8.8.8.8"
    ],
    "DnsSearch":[
      ""
    ],
    "ExtraHosts":null,
    "VolumesFrom":[
      "parent",
      "other:ro"
    ],
    "CapAdd":[
      "NET_ADMIN"
    ],
    "CapDrop":[
      "MKNOD"
    ],
    "RestartPolicy":{
      "Name":"",
      "MaximumRetryCount":0
    },
    "NetworkMode":"bridge",
    "Devices":[
    ],
    "Ulimits":[
    ],
    "LogConfig":{
      "Type":"json-file",
      "Config":{
      }
    },
    "SecurityOpt":[
    ],
    "CgroupParent":""
  }
}
```

>Example response**

```json
{
  "Id":"e90e34656806",
  "Warnings":[]
}
```

### Usage
`POST /containers/create`

### Request Body Parameters:

|                 |              |
|-----------------|--------------| 
| **Hostname**          | A string value containing the hostname to use for the container. |
| **Domainname**        | A string value containing the domain name to use for the container. |
| **User**              | A string value specifying the user inside the container. |
| **Memory**            | Memory limit in bytes. |
| **MemorySwap**        | Total memory limit (memory + swap); set `-1` to disable swap You must use this with `memory` and make the swap value larger than `memory`. |
| **KernelMemory**      | Kernel memory limit in bytes. |
| **CpuShares**         | An integer value containing the container's CPU Shares (ie. the relative weight vs other containers). |
| **CpuPeriod**         | The length of a CPU period in microseconds. |
| **Cpuset**            | Deprecated please don't use. Use `CpusetCpus` instead.  |
| **CpusetCpus**        | String value containing the `cgroups CpusetCpus` to use. |
| **CpusetMems**        | Memory nodes (MEMs) in which to allow execution (0-3, 0,1). Only effective on NUMA systems. |
| **BlkioWeight**       | Block IO weight (relative weight) accepts a weight value between 10 and 1000. |
| **MemorySwappiness**  | Tune a container's memory swappiness behavior. Accepts an integer between 0 and 100. |
| **OomKillDisable**    | Boolean value, whether to disable OOM Killer for the container or not. |
| **AttachStdin**       | Boolean value, attaches to `stdin`. |
| **AttachStdout**      | Boolean value, attaches to `stdout`. |
| **AttachStderr**      | Boolean value, attaches to `stderr`. |
| **Tty**               | Boolean value, Attach standard streams to a `tty`, including `stdin` if it is not closed. |
| **OpenStdin**         | Boolean value, opens stdin, |
| **StdinOnce**         | Boolean value, close `stdin` after the 1 attached client disconnects. |
| **Env**               | A list of environment variables in the form of `VAR=value` |
| **Labels**            | Adds a map of labels to a container. To specify a map: `{"key":"value"[,"key2":"value2"]}` |
| **Cmd**               | Command to run specified as a string or an array of strings. |
| **Entrypoint**        | Set the entry point for the container as a string or an array of strings. |
| **Image**             | A string specifying the image name to use for the container. |
| **Mounts**            | An array of mount points in the container. |
| **WorkingDir**        | A string specifying the working directory for commands to run in. |
| **NetworkDisabled**   | Boolean value, when true disables networking for the container |
| **ExposedPorts**      | An object mapping ports to an empty object in the form of: `"ExposedPorts": { "<port>/<tcp|udp>: {}" }` |
| **HostConfig** |      |
| **Binds**             | A list of volume bindings for this container. Each volume binding is a string in one of these forms: `container_path` to create a new volume for the container, `host_path:container_path` to bindmount a host path into the container, `host_path:container_path:ro` to make the bindmount read-only inside the container. |
| **Links**             | A list of links for the container. Each link entry should be in the form of `container_name:alias`. |
| **LxcConf**           | LXC specific configurations. These configurations only work when using the `lxc` execution driver. |
| **PortBindings**      | A map of exposed container ports and the host port they should map to. A JSON object in the form `{ <port>/<protocol>: [{ "HostPort": "<port>" }] }`.  Take note that `port` is specified as a string and not an integer value. |
| **PublishAllPorts**   | Allocates a random host port for all of a container's exposed ports. Specified as a boolean value. |
| **Privileged**        | Gives the container full access to the host. Specified as a boolean value. |
| **ReadonlyRootfs**    | Mount the container's root filesystem as read only. Specified as a boolean value. |
| **Dns**               | A list of DNS servers for the container to use. |
| **DnsSearch**         | A list of DNS search domains |
| **ExtraHosts**        | A list of hostnames/IP mappings to add to the container's `/etc/hosts` file. Specified in the form `["hostname:IP"]`. |
| **VolumesFrom**       | A list of volumes to inherit from another container. Specified in the form `<container name>[:<ro|rw>]` |
| **CapAdd**            | A list of kernel capabilities to add to the container. |
| **Capdrop**           | A list of kernel capabilities to drop from the container. |
| **RestartPolicy**     | The behavior to apply when the container exits.  The value is an object with a `Name` property of either `"always"` to always restart, `"unlessstopped"` to restart always except when user has manually stopped the container or `"onfailure"` to restart only when the container exit code is nonzero.  If `on-failure` is used, `MaximumRetryCount` controls the number of times to retry before giving up. The default is not to restart. (optional) An ever increasing delay (double the previous delay, starting at 100mS) is added before each restart to prevent flooding the server. |
| **NetworkMode**       | Sets the networking mode for the container. Supported         values are: `bridge`, `host`, and `container:<name|id>` |
| **Devices**           | A list of devices to add to the container specified as a JSON object in the form `{ "PathOnHost": "/dev/deviceName", "PathInContainer": "/dev/deviceName", "CgroupPermissions": "mrw"}` |
| **Ulimits**           | A list of ulimits to set in the container, specified as `{ "Name": <name>, "Soft": <soft limit>, "Hard": <hard limit> }`, for example: `Ulimits: { "Name": "nofile", "Soft": 1024, "Hard", 2048 }}` |
|**SecurityOpt**        | A list of string values to customize labels for MLS systems, such as SELinux. |
| **LogConfig**         | Log configuration for the container, specified as a JSON object in the form: `{ "Type": "<driver_name>", "Config": {"key1": "val1"}}`. Available types: `json-file`, `syslog`, `journald`, `gelf`, `none`.`json-file` logging driver. |
| **CgroupParent**      | Path to `cgroups` under which the container's `cgroup` is created. If the path is not absolute, the path is considered to be relative to the `cgroups` path of the init process. Cgroups are created if they do not already exist. |

### Query Parameters
|          |                                                                            |
|----------|----------------------------------------------------------------------------| 
| **name** | Assign the specified name to the container. Must match `/?[a-zA-Z0-9_-]+`. |

### Status Codes

|         |                                                 |
|---------|-------------------------------------------------| 
| **201** | no error                                        |
| **404** | no such container                               |
| **406** | impossible to attach (container not running)    |
| **500** | server error                                    |

