# ## Clone repos
git clone https://github.com/TencentARC/GFPGAN.git
git clone https://github.com/CompVis/taming-transformers
git clone https://github.com/CompVis/stable-diffusion
git clone https://github.com/openai/CLIP
## pip installs
pip install transformers scipy ftfy ipywidgets msgpack rich  einops omegaconf pytorch_lightning realesrgan  basicsr  optax facexlib realesrgan kornia imwatermark
pip install git+https://github.com/crowsonkb/k-diffusion.git
pip install -e git+https://github.com/CompVis/taming-transformers.git@master#egg=taming-transformers
pip install git+https://github.com/openai/CLIP.git
pip install diffusers
pip install omegaconf einops pytorch_lightning invisible-watermark kornia
# Install and setup repo packages
cd GFPGAN
python setup.py develop
cd ..
## additional setup tasks
cd stable-diffusion
pip install -e .
cp -r ../taming-transformers/taming ./
cd ..
mkdir outputs
mkdir stable-diffusion/models/ldm/stable-diffusion-v1/

sudo apt update
sudo apt install -y aria2
aria2c --seed-time=0 --max-overall-upload-limit=1K "magnet:?xt=urn:btih:3A4A612D75ED088EA542ACAC52F9F45987488D1C&tr=udp://tracker.opentrackr.org:1337"
mv sd-v1-4.ckpt models/ldm/stable-diffusion-v1/model.ckpt 
cd GFPGAN/experiments/pretrained_models
wget https://github.com/TencentARC/GFPGAN/releases/download/v1.3.0/GFPGANv1.3.pth