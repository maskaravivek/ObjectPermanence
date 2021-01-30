#!/bin/bash
#SBATCH -N 1                        # number of cores
#SBATCH --mem=12G
#SBATCH -n 6
#SBATCH -t 4-12:00
#SBATCH -p gpu
#SBATCH -q wildfire
#SBATCH -o nuclei.out             # STDOUT (%j = JobId)
#SBATCH --gres=gpu:2     #number of GPU required
#SBATCH --mail-type=ALL             # Send a notification when the job starts, stops, or fails
#SBATCH --mail-user=vmaskara@asu.edu # send-to address
# Always purge modules to ensure a consistent environment

module load anaconda3/5.3.0
module load cuda/10.2.89

# change environment name
source  activate vivek_deep

python main.py preprocess --results_dir /home/vmaskara/thesis/ObjectPermanence/results --config /home/vmaskara/thesis/ObjectPermanence/configs/preprocess_config.json
