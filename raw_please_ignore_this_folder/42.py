qiime diversity beta-rarefaction \
--i-table $PWDa/dada2/dada2-tablenochloroplastsmitochondriaUnassigned$var.qza \
--i-phylogeny $PWDa/dada2/rooted-tree.qza \
--p-sampling-depth $var \
--p-metric weighted_unifrac \
--p-clustering-method upgma \
--m-metadata-file $PWDa/metadataV34.txt \
--o-visualization $PWDa/dada2/core-metrics-results/beta-rarefaction-upgma.qzv

