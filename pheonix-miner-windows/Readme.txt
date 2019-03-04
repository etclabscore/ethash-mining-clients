PhoenixMiner 4.1c Documentation
===============================

Contents

1. Quick Start
2. Features, requirements, and limitations
3. Command-line arguments
4. Configuration files
5. Remote monitoring and management
6. Hardware control options
7. FAQ
8. Troubleshooting

1. Quick Start
--------------

PhoenixMiner is fast ethash (ETH, ETC, Muiscoin, EXP, UBQ, Pirl, Ellaism, Metaverse ETP, etc.)
miner that supports both AMD and Nvidia cards (including in mixed mining rigs). It runs under
Windows x64 and Linux x64 and has a developer fee of 0.65%. This means that every 90 minutes the
miner will mine for us, its developers, for 35 seconds.

If you have used Claymore's Dual Ethereum miner, you can switch to PhoenixMiner with
minimal hassle as we support most of Claymore's command-line options and configuration
files.

Please note that PhoenixMiner is extensively tested on many mining rigs but there
still may be some bugs. Additionally, we are actively working on bringing many new
features in the future releases. If you encounter any problems or have feature
requests, please post them to our thread in the bitcointalk forum at the following URL:
https://bitcointalk.org/index.php?topic=2647654.0

Here are the command line parameters for some of the more popular pools and coins:

ethermine.org (ETH):
  PhoenixMiner.exe -pool eu1.ethermine.org:4444 -pool2 us1.ethermine.org:4444 -wal YourEthWalletAddress.WorkerName -proto 3
ethermine.org (ETH, secure connection):
  PhoenixMiner.exe -pool ssl://eu1.ethermine.org:5555 -pool2 ssl://us1.ethermine.org:5555 -wal YourEthWalletAddress.WorkerName -proto 3
ethpool.org (ETH):
  PhoenixMiner.exe -pool eu1.ethpool.org:3333 -pool2 us1.ethpool.org:3333 -wal YourEthWalletAddress.WorkerName -proto 3  
dwarfpool.com (ETH):
  PhoenixMiner.exe -pool eth-eu.dwarfpool.com:8008 -wal YourEthWalletAddress/WorkerName -pass x
nanopool.org (ETH):
  PhoenixMiner.exe -pool eth-eu1.nanopool.org:9999 -wal YourEthWalletAddress/WorkerName -pass x
nicehash (ethash):
  PhoenixMiner.exe -pool stratum+tcp://daggerhashimoto.eu.nicehash.com:3353 -wal YourBtcWalletAddress -pass x -proto 4 -stales 0
f2pool (ETH):
  PhoenixMiner.exe -epool eth.f2pool.com:8008 -ewal YourEthWalletAddress -pass x -worker WorkerName  
miningpoolhub (ETH):
  PhoenixMiner.exe -pool us-east.ethash-hub.miningpoolhub.com:20535 -wal YourLoginName.WorkerName -pass x -proto 1
coinotron.com (ETH):
  PhoenixMiner.exe -pool coinotron.com:3344 -wal YourLoginName.WorkerName -pass x -proto 1
ethermine.org (ETC):
  PhoenixMiner.exe -pool eu1-etc.ethermine.org:4444 -wal YourEtcWalletAddress.WorkerName
dwarfpool.com (EXP):
  PhoenixMiner.exe -pool exp-eu.dwarfpool.com:8018 -wal YourExpWalletAddress/WorkerName
miningpoolhub (MUSIC):
  PhoenixMiner.exe -pool europe.ethash-hub.miningpoolhub.com:20585 -wal YourLoginName.WorkerName -pass x -proto 1
maxhash.org (UBIQ):
  PhoenixMiner.exe -pool ubiq-us.maxhash.org:10008 -wal YourUbqWalletAddress -worker WorkerName -coin ubq
ubiq.minerpool.net (UBIQ):
  PhoenixMiner.exe -pool lb.geo.ubiqpool.org:8001 -wal YourUbqWalletAddress -pass x -worker WorkerName -coin ubq
ubiqpool.io (UBIQ):
  PhoenixMiner.exe -pool eu2.ubiqpool.io:8008 -wal YourUbqWalletAddress.WorkerName -pass x -proto 4 -coin ubq  
minerpool.net (PIRL):
  PhoenixMiner.exe -pool pirl.minerpool.net:8002 -wal YourPirlWalletAddress -pass x -worker WorkerName
dodopool.com (Metaverse ETP):
  PhoenixMiner.exe -pool etp.dodopool.com:8008 -wal YourMetaverseETPWalletAddress -worker Rig1 -pass x
minerpool.net (Ellaism):
  PhoenixMiner.exe -pool ella.minerpool.net:8002 -wal YourEllaismWalletAddress -worker Rig1 -pass x
  
Dual-mining command-line examples:

ETH on ethermine.org ETH, Blake2s on Nicehash:
  PhoenixMiner.exe -pool ssl://eu1.ethermine.org:5555 -pool2 ssl://us1.ethermine.org:5555 -wal YourEthWalletAddress.WorkerName -proto 3 -dpool blake2s.eu.nicehash.com:3361 -dwal YourBtcWalletAddress -dcoin blake2s
Nicehash (Ethash + Blake2s):
  PhoenixMiner.exe -pool stratum+tcp://daggerhashimoto.eu.nicehash.com:3353 -wal YourBtcWalletAddress -pass x -proto 4 -stales 0 -dpool blake2s.eu.nicehash.com:3361 -dwal YourBtcWalletAddress -dcoin blake2s

2. Features, requirements, and limitations
------------------------------------------

* Highly optimized OpenCL and CUDA cores for maximum ethash mining speed
* Lowest developer fee of 0.65% (35 seconds defvee mining per each 90 minutes)
* Dual mining ethash/Blake2s with lowest devfee of 0.9% (35 seconds defvee mining per each 65 minutes)
* Advanced statistics: actual difficulty of each share as well as effective hashrate at the pool
* Supports AMD Vega, 580/570/480/470, 460/560, Fury, 390/290 and older AMD GPUs with enough VRAM
* Supports Nvidia 10x0 and 9x0 series as well as older cards with enough VRAM
* DAG file generation in the GPU for faster start-up and DAG epoch switches
* Supports all ethash mining pools and stratum protocols, including solo mining via HTTP
* Supports secure pool connections (e.g. ssl://eu1.ethermine.org:5555) to prevent IP hijacking attacks
* Detailed statistics, including the individual cards hashrate, shares, temperature and fan speed
* Unlimited number of fail-over pools in epools.txt configuration file (or two on the command line)
* GPU tuning for the AMD GPUs to achieve maximum performance with your rig
* Supports devfee on alternative ethash currencies like ETC, EXP, Music, UBQ, Pirl, Ellaism,
  Metaverse ETP, Akroma, WhaleCoin, and Victorium. This avoids any additional loses and instabilities
  becuase of additional DAG generation, and also allows you to use older cards with small VRAM
  or low hashate on current DAG epochs (e.g. GTX970, 280X).
* Supports the new Ubqhash algorithm for the UBQ coin. Please note that you must
  add -coin ubq to your command line (or COIN: ubq to your epools.txt file) in order to mine UBQ
* Full compatibility with the industry standard Claymore's Dual Ethereum miner, including most of
  command-line options, configuration files, and remote monitoring and management.
* More features coming soon!

PhoenixMiner requires Windows x64 (Windows 7, Windows 10, etc.), or Linux x64 (tested on Ubuntu LTS
and Debian stable).

PhenixMiner also supports dual mining (simulataneous mining of ethash and other cryptocoin algorithm).
Currently we support only Blake2s as secondary algorithm for dual mining and this feature is only
supported on AMD GPUs. Note that when using dual mining, there is no devfee on the secondary coin but the
devfee on the main coin is increased to 0.9%. In other words, if you are using the dual mining feature PhoenixMiner
will mine for us for 35 seconds every 65 minutes.

While the miner is running, you can use some interactive commands. Press the key 'h' while the
miner's console window has the keyboard focus to see the list of the available commands. The
interactive commands are also listed at the end of the following section.

3. Command-line arguments
-------------------------

Note that PhoenixMiner supports most of the command-line options of Claymore's dual Ethereum miner
so you can use the same command line options as the ones you would have used with Claymore's miner.

Pool options:
  -pool <host:port> Ethash pool address (prepend the host name with ssl:// for SSL pool, or http:// for solo mining)
  -wal <wallet> Ethash wallet (some pools require appending of user name and/or worker)
  -pass <password> Ethash password (most pools don't require it, use 'x' as password if unsure)
  -worker <name> Ethash worker name (most pools accept it as part of wallet)
  -proto <n> Selects the kind of stratum protocol for the ethash pool:
     1: miner-proxy stratum spec (e.g. coinotron)
     2: eth-proxy (e.g. dwarfpool, nanopool) - this is the default, works for most pools
     3: qtminer (e.g. ethermine, ethpool)
     4: EthereumStratum/1.0.0 (e.g. nicehash)
  -coin <coin> Ethash coin to use for devfee to avoid switching DAGs:
     auto: Auto-detect the coin (default)
     eth: Ethereum
     etc: Ethereum Classic
     exp: Expanse
     music: Musicoin
     ubq: UBIQ
     pirl: Pirl
     ella: Ellaism
     etp: Metaverse ETP
     pgc: Pegascoin
	 akroma: Akroma
     whale: WhaleCoin
	 vic: Victorium
	 nuko: Nekonium
	 mix: Mix
	 egem: EtherGem
	 aura: Aura
	 gen: Genom
	 clo: Callisto
	 dbix: DubaiCoin
	 moac: MOAC
	 etho: Ether-1
	 etcc: EtherCC
  -stales <n> Submit stales to ethash pool: 1 - yes (default), 0 - no
  -pool2 <host:port>  Failover ethash pool address. Same as -pool but for the failover pool
  -wal2 <wallet> Failover ethash wallet (if missing -wal will be used for the failover pool too)
  -pass2 <password> Failover ethash password (if missing -pass will be used for the failover pool too)
  -worker2 <name> Failover ethash worker name (if missing -worker will be used for the failover pool too)
  -proto2 <n> Failover ethash stratum protocol (if missing -proto will be used for the failover pool too)
  -coin2 <coin> Failover devfee Ethash coin (if missing -coin will be used for the failover pool too)
  -stales2 <n> Submit stales to the failover pool: 1 - yes (default), 0 - no
  -dpool <host:port> Dual mining pool address
  -dwal <wallet> Dual mining wallet
  -dpass <password> Dual mining pool password (most pools don't require it, use 'x' as password if unsure)
  -dworker <name> Dual mining worker name
  -dcoin blake2s Currently only the Blake2s algorithm is supported for dual mining. If you want to put
     all dual mining pools in dpools.txt, you need to set -dcoin blake2s in the command-line or in config.txt
	 to force the miner to load the dual mining pools from dpools.txt
  -dstales <n> Submit stales to the dual mining pool: 1 - yes (default), 0 - no
General pool options:
  -fret <n> Switch to next pool afer N failed connection attempts (default: 3)
  -ftimeout <n> Reconnect if no new ethash job is receved for n seconds (default: 600)
  -ptimeout <n> Switch back to primary pool after n minutes. This setting is 30 minutes by default;
     set to 0 to disable automatic switch back to primary pool.
  -retrydelay <n> Seconds to wait before reconnecting (default: 20)
  -gwtime <n> Recheck period for Solo/GetWork mining (default: 200 ms)
  -rate <n> Report hashrate to the pool: 1 - yes, 0 - no (1 is the default)
Benchmark mode:
  -bench [<n>],-benchmark [<n>] Benchmark mode, optionally specify DAG epoch. Use this to test your rig.
Remote control options:
  -cdm <n> Selects the level of support of the CDM remote monitoring:
     0: disabled
     1: read-only - this is the default
     2: full (only use on secure connections)
  -cdmport <port> Set the CDM remote monitoring port (default is 3333). You can also specify
     <ip_addr:port> if you have a secure VPN connection and want to bind the CDM port to it
  -cdmpass <pass> Set the CDM remote monitoring password
  -cdmrs Reload the settings if config.txt is edited/uploaded remotely. Note that most options require restart in order to change.
      Currently the follwing options can be changed without restarting: -mi, -gt, -sci, -clf, -nvf, and all hardware control parameters
      (-tt, -fanmin, -fanmax, -powlim, -tmax, -cclock, -cvddc, -mclock, -mvddc).
Mining options:
  -amd  Use only AMD cards
  -acm  Turn on AMD compute mode on the supported GPUs. This is equivalent of pressing 'y' in the miner console.
  -nvidia  Use only Nvidia cards
  -gpus <123 ..n> Use only the specified GPUs (if more than 10, separate the indexes with comma)
  -mi <n> Set the mining intensity (0 to 14; 12 is the default for new kernels). You may specify this option per-GPU.
  -gt <n> Set the GPU tuning parameter (6 to 400). The default is 15. You can change the
          tuning parameter interactively with the '+' and '-' keys in the miner's console window.
		  You may specify this option per-GPU. If you don't specify -gt or you specify value 0,
		  the miner will use auto-tuning to determine the best GT value. Note that when the GPU is
		  dual-mining, it ignores the -gt values, and uses -sci instead.
  -sci <n> Set the dual mining intensity (1 to 1000). The default is 30. As you increase the value of -sci,
           the secondary coin hashrate will increase but the price will be higher power consumption and/or
		   lower ethash hashrate.
		   You can change the this parameter interactively with the '+' and '-' keys in the miner's
		   console window. You may specify this option per-GPU. If you set -sci to 0,
		   the miner will use auto-tuning to determine the best value, while trying to maximize the
		   ethash hashrate regardless of the secondary coin hashrate.
  -clKernel <n> Type of OpenCL kernel: 0 - generic, 1 - optimized, 2 - alternative, 3 - turbo (1 is the default)
                You may specify this option per-GPU.
  -clgreen <n> Use the power-efficient ("green") kernels (0: no, 1: yes; default: 0).
               You may specify this option per-GPU. Note that you have to run auto-tune again as the
			   optimal GT values are completely different for the green kernels
  -clNew <n> Use new AMD kernels if supported (0: no, 1: yes; default: 1). You may specify this option per-GPU.
  -clf <n> AMD kernel sync (0: never, 1: periodic; 2: always; default: 1). You may specify this option per-GPU.
  -nvNew <n> Use new Nvidia kernels if supported (0: no, 1: yes; default: 1). You may specify this option per-GPU.
  -nvf <n> Nvidia kernel sync (0: never, 1: periodic; 2: always; 3: forced; default: 1). You may specify this option per-GPU.
  -mode <n> Mining mode (0: dual mining if dual pool(s) are specified; 1: ethash only even if dual pools are specified).
      You may specify this option per-GPU.
  -list List the detected GPUs devices and exit
  -minRigSpeed <n> Restart the miner if avg 5 min speed is below <n> MH/s
  -eres <n> Allocate DAG buffers big enough for n epochs ahead (default: 2) to
      avoid allocating new buffers on each DAG epoch switch, which should improve DAG switch stability.
	  You may specify this option per-GPU.
  -lidag <n> Slow down DAG generation to avoid crashes when switching DAG epochs
      (0-3, default: 0 - fastest, 3 - slowest). You may specify this option per-GPU.
	  Currently the option works only on AMD cards
  -gser <n> Serializing DAG creation on multiple GPUs (0 - no serializing, all GPUs generate the DAG simultaneously, this is the default;
      1 - partial overlap of DAG generation on each GPU; 2 - no overalp (each GPU waits until the previous one has finished generating the DAG);
	  3-10 - from 1 to 8 seconds delay after each GPU DAG generation before the next one)
  -gpureset <n> Fully reset GPU when paused (0 - no, 1 - yes; default: no, except on 1080Ti)
                You may specify this option per-GPU.
  -rvram <n> Minimum free VRAM in MB (-1: don't check; default: 384 for Windows, and 128 for Linux)
  -altinit Use alternative way to initialize AMD cards to prevent startup crashes
  -wdog <n> Enable watchdog timer: 1 - yes, 0 - no (1 is the default). The watchdog timer checks
      periodically if any of the GPUs freezes and if it does, restarts the miner (see the -rmode
      command-line parameter for the restart modes)
  -wdtimeout <n> Watchdog timeout (30 - 300; default 45 seconds). You can use this parameter to increase
      the default watchdog timeout in case it restarts the miner needlessly
  -rmode <n> Selects the restart mode when a GPU crashes or freezes:
     0: disabled - miner will shut down instead of restarting
     1: restart with the same command line options - this is the default
     2: reboot (shut down miner and execute reboot.bat)
  -log <n> Selects the log file mode:
     0: disabled - no log file will be written
     1: write log file but don't show debug messages on screen (default)
     2: write log file and show debug messages on screen
  -logfile <name> Set the name of the logfile. If you place an asterisk (*) in the logfile name, it will be
      replaced by the current date/time to create a unique name every time PhoenixMiner is started. If there
	  is no asterisk in the logfile name, the new log entries will be added to end of the same file. If you
	  want to use the same logfile but the contents to be overwritten every time when you start the miner,
	  put a dollar sign ($) character in the logfile name (e.g. -logfile my_log.txt$).
  -logdir <path> Set a path where the logfile(s) will be created
  -logsmaxsize <n> Maximum size of the logfiles in MB. The default is 200 MB (use 0 to turn off the limitation).
      On startup, if the logfiles are larger than the specified limit, the oldest are deleted. If you use a
	  single logfile (by using -logfile), then it is truncated if it is bigger than the limit and a new one
	  is created.
  -timeout <n> Restart miner according to -rmode after n minutes
  -pauseat <hh:mm> Pause the miner at hh::mm (24 hours time). You can specify multiple times: -pauseat 6:00,12:00
  -resumeat <hh:mm> Resume the miner at hh::mm (24 hours time). You can specify multiple times: -resumeat 8:00,22:00
  -gswin <n> GPU stats time window (5-30 sec; default: 15; use 0 to revert to pre-2.8 way of showing momentary stats)
  -gsi <n> Speed stats interval (5-30 sec; default: 5; use 0 to disable). The detailed stats are still
           shown every 45 seconds and aren't affected by the -gsi value
  -astats <n> Show advanced stats from Web sources (0: no; 1: yes). By default the coin exchange rates are updated every
           4 hours, and the coin difficulty is updated every 8 hours. You can increase these periods by specifying
		   for example -astats 12, which will increase update periods to 12 and 24 hours respectively
  -gpow <n> Lower the GPU usage to n% of maximum (default: 100). If you already use -mi 0 (or other low value) use -li instead.
            You may specify this option per-GPU.
  -li <n> Another way to lower the GPU usage. Bigger n values mean less GPU utilization; the default is 0.
          You may specify this option per-GPU.
  -resetoc Reset the HW overclocking settings on startup
  -leaveoc Do not reset overclocking settings when closing the miner
Hardware control options (AMD cards only; you may specify these options per-GPU.):
  -tt <n> Set fan control target temperature (special values: 0 - no HW monitoring on ALL cards,
     1-4 - only monitoring on all cards with 30-120 seconds interval, negative - fixed fan speed at n %)
  -fanmin <n> Set fan control min speed in % (-1 for default)
  -fanmax <n> Set fan control max speed in % (-1 for default)
  -tmax <n> Set fan control max temperature (0 for default)
  -powlim <n> Set GPU power limit in % (from -75 to 75, 0 for default)
  -cclock <n> Set GPU core clock in MHz (0 for default)
  -cvddc <n> Set GPU core voltage in mV (0 for default)
  -mclock <n> Set GPU memory clock in MHz (0 for default)
  -mvddc <n> Set GPU memory voltage in mV (0 for default)
  -tstop <n> Pause a GPU when temp is >= n deg C (0 for default; i.e. off)
  -tstart <n> Resume a GPU when temp is <= n deg C (0 for default; i.e. off)
General Options:
  -v,--version  Show the version and exit
  -vs Show short version string (e.g. "4.1c") and exit
  -h,--help  Show information about the command-line options and exit
  
Per-GPU options
---------------
Some of the PhoenixMiner options can provide either the same setting for all GPUs, or a different
setting for each of the GPUs. For example, to specify the -gt value for all cards you would write
-gt 90 but if you want to specify a different GT value for each of the cards, use something like this:
-gt 20,15,40,90,90 for a five-GPU mining rig. This would set GT to 20 for the first GPU, 15 for the second
GPU, and so on. If you specify less values than you have GPUs, the rest of the GPUs will use the default
value for the parameter.  
  
Additionally, while the miner is running, you can use the following interactive commands
in the console window by pressing one of these keys:
  s   Print detailed statistics
  1-9 Pause/resume GPU1 ... GPU9
  p   Pause/resume the whole miner
  +,- Increase/decrease GPU tuning parameter
  g   Reset the GPU tuning parameter (and stop auto-tuning if active)
  x   Select the GPU(s) for manual or automatic GT tuning
  z   Start AMD auto-tune process
  r   Reload epools.txt and switch to primary ethash pool
  e   Select the current ethash pool
  d   Select the current dual-mining pool
  y   Turn on AMD Compute mode if it is off on some of the GPUs
  c   Reload the config.txt file (some settings require restart)
  h   Print this short help  

4. Configuration files
----------------------

Note that PhoenixMiner supports the same configuration files as Claymore's dual Ethereum miner
so you can use your existing configuration files without any changes.

Instead of using command-line options, you can also control PhoenixMiner with configuration
files. If you run PhoenixMiner.exe without any options, it will search for the file config.txt
in the current directory and will read its command-line options from it. If you want, you can
use file with another name by specifying its name as the only command-line option
when running PhoenixMiner.exe.

You will find an example config.txt file in the PhoenixMiner's directory.

Instead of specifying the pool(s) directly on the command line, you can use another configuration
file for this, named epools.txt. There you can specify one pool per line (you will find an example
epools.txt file in the PhoenixMiner's directory).

For the dual mining pools, you can use the dpools.txt file, which has the same format as epools.txt
but for the secondary coin. You will find an example epools.txt file in the PhoenixMiner's directory.
Note that unlike the epools.txt, which is loaded each time when the miner starts, the dpools.txt file
is only read if you specify a dual mining pool on the command line with -dpool, or at least add
the -dcoin blake2s command-line option.

The advantages of using config.txt and epools.txt/dpools.txt files are:
- If you have multiple rigs, you can copy and paste all settings with these files
- If you control your rigs via remote control, you can change pools and even the miner options by
uploading new epools.txt files to the miner, or by uploading new config.txt file and restarting
the miner.

5. Remote monitoring and management
-----------------------------------

Phoenix miner is fully compatible with Claymore's dual miner protocol for remote monitoring and
management. This means that you can use any tools that are build to support Claymore's dual miner,
including the "Remote manager" application that is part of Claymore's dual miner package.

We are working on much more powerful and secure remote monitoring and control functionality and
control center application, which will allow better control over your remote or local rigs and some
unique features to increase your mining profits.

6. Hardware control options
---------------------------

Here are some important notes about the hardware control options:

* If you specify a single value (e.g. -cvddc 1150), it will be used on all cards. Specify different
  values for each card like this (separate with comma): -cvddc 1100,1100,1150,1120,1090 
  If the specified values are less than the number of GPUs, the rest of GPUs will use the default values.

* We have tested only on relatively recent AMD GPUs (RX460/470/480/560/570/580 and Vega).
  Your results may vary with older GPUs.
  
* The blockchain beta drivers from AMD show quite unstable results - often the voltages don't stick at
  all or revert back to the default after some time. For best results use the newest drivers from AMD:
  18.1.1 or 18.2.1, where most of the bugs are fixed.
  
* -tmax specifies the temperature at which the GPU should start to throttle (because the fans can't keep up).

* If you use other programs for hardware control, conflicts are possible and quite likely. Use something
  like GPU-Z to monitor the voltages, etc. MSI Afterburner also seems to behave OK (so you can use it to
  control the Nvidia cards while AMD cards are controller by PhoenixMiner).
  
* This should be obvious but still: if given clocks/voltages are causing crahses/freezes/incorrect shares
  when set with third-party program, they will be just as much unstable when set via PhoenixMiner hardware
  control options.
  
* If you have problems with hardware control options of PhoenixMiner and you were using something else to
  control clocks, fans, and voltages (MSI Aftrerburner, OverdriveNTool, etc.), which you were happy with,
  it is probably best to keep using it and ignore the hardware control options of PhoenixMiner (or use only
  some of them and continue tweaking the rest with your third-party tools).

7. FAQ
------

Q001: Why another miner?
   A: We feel that the competition is good for the end user. In the first releases of PhoenixMiner
   we focused on the basic features and on the mining speed but we are now working on making our
   miner easier to use and even faster.
   
Q002: Can I run several instances of PhoenixMiner on the same rig?
   A: Yes, but make sure that each GPU is used by a single miner (use the -gpus, -amd, or -nvidia
   command-line options to limit the GPUs that given instance of PhoenixMiner actually uses).
      Another possible problem is that all instances will use the default CDM remote port 3333,
   which will prevent proper remote control for all but the first instance. To fix this problem,
   use the -cdmport command-line option to change the CDM remote port form its default value.
   
Q003: Can I run PhoenixMiner simultaneously on the same rig with other miners?
   A: Yes, but see the answer to the previous question for how to avoid problems.
   
Q004: What is a stale share?
   A: The ethash coins usually have very small average block time (15 seconds in most instances).
   On the other hand, to achieve high mining speed we must keep the GPUs busy so we can't switch
   the current job too often. If our rigs finds a share just after the someone else has found a
   solution for the current block, our share is a stale share. Ideally, the stale shares should be
   minimal as same pools do not give any reward for stale shares, and even these that do reward
   stall shares, give only partial reward for these shares. If the share is submitted too long
   after the block has ended, the pool may even fully reject it.
   
Q005: Why is the percentage of stale shares reported by PhoenixMiner smaller than the one shown
   by the pool?
   A: PhonixMiner can only detect the stale shares that were discovered after it has received a
   new job (i.e. the "very stale") shares. There is additional latency in the pool itself, and in
   the network connection, which makes a share stall even if it was technically found before the
   end of the block from the miner's point of view. As pools only reports the shares as accepted
   or rejected, there is no way for the miner to determine the stale shares from the pool's
   point of view.
   
Q006: What is the meaning of the "actual share difficulty" shown by PhoenixMiner when a share is
   found?
   A: It allows you to see how close you were to finding an actual block (a rare event these days
   for the most miners with reasonable-sized mining rigs). You can find the current difficulty for
   given coin on sites like whattomine.com and then check to see if you have exceeded it with your
   maximum share difficulty. If you did, you have found a block (which is what the mining is all
   about).
   
Q007: What is the meaning of "effective speed" shown by PhoenixMiner's statistics?
   A: This is a measure of the actually found shares, which determines how the pool sees your
   miner hashrate. This number should be close to the average hashrate of your rig (usually a 2-4%
   lower than it) depending you your current luck in finding shares. This statistic is meaningless
   in the first few hours after the miner is started and will level off to the real value with
   time.
   
Q008: Why is the effective hashrate shown by the pool lower than the one shown by PhoenixMiner?
   A: There are two reasons for this: stale shares and luck. The stale shares are rewarded at only
   about 50-70% by most pools. The luck factor should level itself off over time but it may take
   a few days before it does. If your effective hashrate reported by the pool is consistently lower
   than the hashrate of your rig by more than 5-7% than you should look at the number of stale shares
   and the average share acceptance time - if it is higher than 100 ms, try to find a pool that is
   near to you geographically to lower the network latency. You can also restart your rig, or
   try another pool.

8. Troubleshooting
------------------

P001: I'm using AMD RX470/480/570/580 or similar card and my hashrate dropped significantly in the past
	  few months for Ethereum and Ethereum classic!
	  S: This is known problem with some cards. For the newer cards (RX470/480/570/580), this can be
	  solved by using the special blockchain driver from AMD (or try the latest drivers, they may
	  incorporate the fix). For the older cards there is no workaround but you still can mine EXP,
	  Musicoin, UBQ or PIRL with the same speed that you mined ETH before the drop.
	  
P002: My Nvidia GTX9x0 card is showing very low hashrate under Windows 10!
      S: While there is a (convoluted) workaround, the best solution is to avoid Windows 10
      for these cards - use Windows 7 instead.
      
P003: I'm using Nvidia GTX970 (or similar) card and my hashrate dropped dramatically for Ethereum or
      Ethereum classic!
      S: GTX970 has enough VRAM for larger DAGs but its hashate drops when the DAG size starts
      to exceed 2 GB or so. Unlike the AMD Polaris-based cards, there is no workaround for this
      problem. We recommend using these cards to mine EXP, Musicoin, UBQ or PIRL with the same speed
      that you used to ETH before the drop.
      
P004: I can't see some of my cards (or their fan speed and temperature) when using Windows Remote Desktop (RDP)!
      S: This is a known problem with RDP. Use VNC or TeamViewer instead.
      
P005: On Windows 10, if you click inside the PhoenixMiner console, it freezes!
      S: This is a known problem on Windows 10, related to so called "Quick Edit" feature of the command
	  prompt window. From PhoenixMiner 2.6, the QuickMode is disabled by default, so you shouldn't experience
	  this problem. If you still, do, read here how to solve it: https://stackoverflow.com/q/33883530
	  
P006: Immediately after starting, PhoenixMiner stops working and the last message is "debugger detected"
      S: If you have only Nvidia cards, add the option -nvidia to the PhoenixMiner.exe command line.
	  If you have only AMD cards, add the option -amd to the command line.
	  
P007: PhoenixMiner shows an error after allocating DAG buffer and shuts down.
      S: If you have more than one GPU, make sure that your Windows page file minimal size is set to at
	  least (N x DS + 4) GB, where N is the number of GPUs, and DS is the size of DAG in GB (about 2.7 GB around
	  September 2018 for ETC and ETH). For example, if you have 10 GPUs, you need 10 x 2.7 + 4 = 31 GB minimal
      size of the page file. Note that this will increase as the DAG sizes increase.
	  
P008: The miner sometimes crashes when the DAG epoch change.
      S: During DAG generation, the GPUs are loaded more than during the normal operation. If you have
	  overclocked or undervolted the GPUs "to the edge", the DAG generation ofter pushes them "over the
	  edge". Another possible reason for the crash (especially if the whole rig crashes) is the higher
	  power usage during this process. You can lower the DAG generation speed by specifying the -lidag
	  command-line option. The possible values are 0 (no slow down), 1, 2, and 3 (max slowdown).
	  In order to check if your rig would be stable during DAG generation, run it in benchmark mode
	  by specifying the -bench 170 command line option. Then every time when you press the key 'd'
	  the miner will advance to the next DAG epoch, and you will be able to see if it is stable during
	  multiple DAG generations. If it isn't you can try to alter the -lidag and -eres command line options
	  until the desired stability is achieved.
