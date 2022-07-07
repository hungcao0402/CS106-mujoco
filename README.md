## Install 

```bash
pip install tianshou envpool
```

## Usage

Run

```bash
$ python mujoco_ppo.py --task Ant-v3
```

Logs is saved in `./log/` and can be monitored with tensorboard.

You can also reproduce the benchmark (e.g. PPO in Ant-v3) with the example script

```bash
$ ./run_experiments.sh Ant-v3 ppo
```

This will start 10 experiments with different seeds.

Now that all the experiments are finished, we can convert all tfevent files into csv files and then try plotting the results.

```bash
# generate csv
$ ./tools.py --root-dir ./results/Ant-v3/ppo
# generate figures
$ ./plotter.py --root-dir ./results/Ant-v3 --shaded-std --legend-pattern "\\w+"
# generate numerical result (support multiple groups: `--root-dir ./` instead of single dir)
$ ./analysis.py --root-dir ./results --norm
```
## Example benchmark
<img src="./results/Ant-v3/figure.png" width="500" height="450">

## Docker

For being convenient, We provide Dockerfile which could be used for running training or you can just install requiments.txt

### Build

```bash
docker built -t tianshou .
```

### Run 

```bash
docker run -it --gpus device=0 --rm -v "$PWD":/tianshou tianshou 
```

## Result
All logging and trained model are located in ```results``` folder.

The ```results``` folder structure:
```
+-- results
|   +-- Ant-v3
|       +-- ppo
|           +-- 0                                                     - seed 0
|             +-- events.out.tfevents.1656182884.0f40ec0f35c4.15.0    - Tensorboard file
|             +-- policy.pth                                          - Model file
|             +-- test_reward.csv                                     
|           +-- 1                                                     - seed 1
...
|           +-- test_reward_10seeds.csv                               - result file      
|       +-- ddpg
|       +-- ppo
|       +-- figure.png                                                - Benchmark of three algorithms 
...
|   +-- HalfCheetah-v3
|   +-- Swimmer-v3
|   +-- Walker2d-v3
...
```

