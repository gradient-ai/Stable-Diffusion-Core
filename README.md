# Stable Diffusion Core

Description:
This repo ontains quick setup instructions and assistance for launching Stable Diffusion on Paperspace Core's ML-in-a-box Machines.

# Recommended Core setup

- In the Core machine create page, be sure to select the ML-in-a-box machine tile
- It is recommended that you select a GPU machine instance with at least 16 GB of GPU ram for this setup in its current form
- Be sure to set up your SSH keys before you create this machine

# Machine setup

To get started on your Core machine, first clone this repository into your working directory of choice. Then, simply run `bash setup.sh` to quickly setup your environment with the following:

## Cloned repos

- https://github.com/TencentARC/GFPGAN.git
- https://github.com/CompVis/taming-transformers
- https://github.com/CompVis/stable-diffusion
- https://github.com/openai/CLIP

## pip installs

- transformers
- scipy
- ftfy
- ipywidgets
- msgpack
- rich
- einops
- omegaconf
- pytorch_lightning
- realesrgan
- basicsr
- optax
- facexlib
- realesrgan
- kornia
- diffusers
- invisible-watermark
- kornia

## Github repo package installs

- https://github.com/crowsonkb/k-diffusion.git
- https://github.com/CompVis/taming-transformers.git@master#egg=taming-transformers
- https://github.com/openai/CLIP.git
- https://github.com/TencentARC/GFPGAN.git
- https://github.com/CompVis/stable-diffusion

## additional setup tasks

- cp -r ../taming-transformers/taming ./

## get the models

- Download the `sd-v1-4.ckpt` file to `stable-diffusion/models/ldm/stable-diffusion-v1/`
- download the GFPGAN model to its

# Inference: txt2img

Once you have completed set up by executing `bash setup.sh`, you are now ready to begin generating images!

You can follow the sample prompting methodology from the original CompVis repo for stable diffusion for a quick test:

`python scripts/txt2img.py --prompt "a photograph of an astronaut riding a horse" --plms `

By default this will use a guidance scale of 7.5, height and width of 512, and 50 diffusion sampling steps. The full list of arguments can be found here:

```
usage: txt2img.py [-h] [--prompt [PROMPT]] [--outdir [OUTDIR]] [--skip_grid] [--skip_save] [--ddim_steps DDIM_STEPS] [--plms] [--laion400m] [--fixed_code] [--ddim_eta DDIM_ETA]
                  [--n_iter N_ITER] [--H H] [--W W] [--C C] [--f F] [--n_samples N_SAMPLES] [--n_rows N_ROWS] [--scale SCALE] [--from-file FROM_FILE] [--config CONFIG] [--ckpt CKPT]
                  [--seed SEED] [--precision {full,autocast}]

optional arguments:
  -h, --help            show this help message and exit
  --prompt [PROMPT]     the prompt to render
  --outdir [OUTDIR]     dir to write results to
  --skip_grid           do not save a grid, only individual samples. Helpful when evaluating lots of samples
  --skip_save           do not save individual samples. For speed measurements.
  --ddim_steps DDIM_STEPS
                        number of ddim sampling steps
  --plms                use plms sampling
  --laion400m           uses the LAION400M model
  --fixed_code          if enabled, uses the same starting code across samples
  --ddim_eta DDIM_ETA   ddim eta (eta=0.0 corresponds to deterministic sampling
  --n_iter N_ITER       sample this often
  --H H                 image height, in pixel space
  --W W                 image width, in pixel space
  --C C                 latent channels
  --f F                 downsampling factor
  --n_samples N_SAMPLES
                        how many samples to produce for each given prompt. A.k.a. batch size
  --n_rows N_ROWS       rows in the grid (default: n_samples)
  --scale SCALE         unconditional guidance scale: eps = eps(x, empty) + scale * (eps(x, cond) - eps(x, empty))
  --from-file FROM_FILE
                        if specified, load prompts from this file
  --config CONFIG       path to config which constructs model
  --ckpt CKPT           path to checkpoint of model
  --seed SEED           the seed (for reproducible sampling)
  --precision {full,autocast}
                        evaluate at this precision
```

# Inference: img2img

Stable Diffusion also boasts powerful capabilities for img2img generation as well. This can be used to impart your desired changes on an existing image that follows the direction of your prompt.

You can test this on any sample photo of appropriate size as the init image. Below is the test cue from the original repo:

`python scripts/img2img.py --prompt "A fantasy landscape, trending on artstation" --init-img <path-to-img.jpg> --strength 0.8`

Many of the same arguments are used here as were above. In addition,

-- `strength` which represents how much destruction of the original image takes place during noising. a score of 0 would have no destruction and leave the image unchanged, while a score of 1 would leave the original image completely without affect on the output due to total destuction
-- `init_img` the path to your image. Recommended size is 512x512.

# Retrieving files from Remote machine

To get your generated images back, simply execute the following in your terminal:

`sftp -r paperspace@<your_Paperspace_IP_Address>:~/`

then use `get <filename>` to download the file to your local before using `quit` to exit
