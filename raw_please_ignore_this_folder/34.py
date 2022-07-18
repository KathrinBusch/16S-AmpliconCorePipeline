qiime diversity alpha-rarefaction \
--i-table $PWDa/dada2/dada2-tablenochloroplastsmitochondriaUnassigned.qza \
--i-phylogeny $PWDa/dada2/rooted-tree.qza \
--p-max-depth $variable \
--p-steps 100 \
--p-iterations 10 \
--m-metadata-file $PWDa/metadataV34.txt \
--o-visualization $PWDa/dada2/core-metrics-results/alpha-rarefaction_complete.qzv
