#copy nanoseqPatch.diff to /input

#execute this in the exp-pod
apt update
apt install -y git
cd /input
mkdir pipelines
cd pipelines

git clone https://github.com/nf-core/rnaseq.git
cd rnaseq
git checkout e049f51f0214b2aef7624b9dd496a404a7c34d14
cd ..

git clone https://github.com/nf-core/sarek.git
cd sarek
git checkout bcd7bf9cb98cddec27bb54fb47ee122c09388c02
cd ..

git clone https://github.com/nf-core/chipseq.git
cd chipseq
git checkout 51eba00b32885c4d0bec60db3cb0a45eb61e34c5
cd ..

git clone https://github.com/nf-core/atacseq.git
cd atacseq
git checkout f327c86324427c64716be09c98634ae0bc8165f6
cd ..

git clone https://github.com/nf-core/mag.git
cd mag
git checkout a8e92af70eca59a92b72262e6cdde11e69375801
cd ..

git clone https://github.com/nf-core/ampliseq.git
cd ampliseq
git checkout 708b8398d007d9a8c907ce6da478717e1ab5f5bc
cd ..

git clone https://github.com/nf-core/methylseq.git
cd methylseq
git checkout 03972a686bedeb2920803cd575f4d671e9135af0
cd ..

git clone https://github.com/nf-core/nanoseq.git
cd nanoseq
git checkout 1e60482a2c4621234393a6eef8e9a104309c20ae

cd ..

git clone https://github.com/nf-core/rnafusion.git
cd rnafusion
git checkout 6ffe30435b611339999145e4b71ac59158cf1182
cd ..

git clone https://github.com/nf-core/viralrecon.git
cd viralrecon
git checkout 3ee1fe98fdf17a80922aa8cf4da4afaf483f3429
cd ..

git clone https://github.com/nf-core/eager.git
cd eager
git checkout bb32ae3b0110b9a26b791f73a5324828d849271a
cd workflows
patch nanoseq.nf < /input/nanoseqPatch.diff
cd ..
cd /input


#execute locally
cd inputs
kubectl cp rnaseq exp-pod:/input/
kubectl cp sarek exp-pod:/input/
kubectl cp chipseq exp-pod:/input/
kubectl cp atacseq exp-pod:/input/
kubectl cp mag exp-pod:/input/
kubectl cp ampliseq exp-pod:/input/
kubectl cp nanoseq exp-pod:/input/
kubectl cp viralrecon exp-pod:/input/
kubectl cp eager exp-pod:/input/

