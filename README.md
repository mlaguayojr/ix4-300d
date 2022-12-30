# ix4-300d

This repo is intended to contain a collection of scripts/systems that I'll be using to help maintain my Lenovo ix4-300d is my main NAS.

## About the Lenovo ix4-300d

| Lenovo EMC IX4-300D Specifications ||
|----|----|
| Processor | Marvell Armada XP 1.3 GHz Dual Core |
| Memory | 512 MB DDR3 RAM |


Source: [https://www.parallelminer.com/product/lenovo-emc-ix4-300d-network-storage-media-server-4tb-8tb-12tb-diskless/](https://www.parallelminer.com/product/lenovo-emc-ix4-300d-network-storage-media-server-4tb-8tb-12tb-diskless/)

As stated from the source above:
> After March 31, 2020, Lenovo will no longer provide security updates or technical support for the following devices: Lenovo ix4-300d & LenovoEMC px2-300d, px4-300d, px6-300d, px4-400d, px4-400r, px4-300r, px12-400r, px12-450r.
> 
> What does this mean? Lenovo is ending their LenovoEMC storage division and will no longer offer warranty or technical support for any LenovoEMC products. Certain features will no longer be available to access such as personal cloud, photo upload service, network video recorder. For more information on the LenovoEMC end of service, refer to Lenovo's website.
> 
> LenovoEMC storage units will still function normally as a network attached storage device to backup or transfer files between devices connected on the same network.

## Summary of Scripts
This section will have a summary of the scripts linked and how they are used.

### fileHash.sh
Currently my main project on gathering information on the files within my NAS pool(s). This lives on my NAS as a shell script and I run it manually via SSH (as root user). This will generate a directory like so:

```
- Automations
  - logs
    - md5sum_2022_12_29.json
  - md5sum.json
```

When `fileHash.sh` is executed it will look move the output of the last run to `Automations\logs\` with the date (YYYY_MM_DD) appended.

The contents of the `md5sum.json` will follow json document format.

```json
[
  {
    "file_name": "./fileHashes.sh",
    "md5": "409ec2042f4072e6587670632fb37823",
    "bytes": 550
  },
  ...
]
```

The intention is then to pass this file to a python script to parse this information and to create a report for me (summary stats, charts, etc.) either PDF or e-mail.

On average, this script takes about ~4-4.5 hours (performance is heavily factored on folder structures [single directories vs nested directories] and size of files [kb vs mb vs gb]).

TODO(s):
 - [x] create script to collect file information and run on NAS
 - [ ] have python script parse output json file and create some form of report
    - Need to do more research to see if this is something that I can/should do on the NAS or forward this file to a raspberry-pi and have it finish that process.
 - [ ] ????
 - [ ] profit

 ## Other Tools
 * terminal to ssh
 * winscp to copy files from NAS