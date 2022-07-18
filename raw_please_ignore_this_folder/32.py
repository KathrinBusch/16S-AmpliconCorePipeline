qiime phylogeny align-to-tree-mafft-fasttree \
--p-n-threads 0 \
--i-sequences $PWDa/dada2/dada2-rep-seqs.qza \
--o-alignment $PWDa/dada2/aligned-rep-seqs.qza \
--o-masked-alignment $PWDa/dada2/masked-aligned-rep-seqs.qza \
--o-tree $PWDa/dada2/unrooted-tree.qza \
--o-rooted-tree $PWDa/dada2/rooted-tree.qza

qiime diversity core-metrics-phylogenetic \
--p-n-jobs 8 \
--i-phylogeny $PWDa/dada2/rooted-tree.qza \
--i-table $PWDa/dada2/dada2-tablenochloroplastsmitochondriaUnassigned$var.qza \
--p-sampling-depth $var \
--m-metadata-file $PWDa/metadataV34.txt \
--output-dir $PWDa/dada2/core-metrics-results

qiime diversity alpha-rarefaction \
--i-table $PWDa/dada2/dada2-tablenochloroplastsmitochondriaUnassigned$var.qza \
--i-phylogeny $PWDa/dada2/rooted-tree.qza \
--p-max-depth $var \
--p-steps 100 \
--p-iterations 10 \
--m-metadata-file $PWDa/metadataV34.txt \
--o-visualization $PWDa/dada2/core-metrics-results/alpha-rarefaction.qzv
