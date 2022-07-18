qiime feature-table filter-samples \
--i-table $PWDa/dada2/dada2-tablenochloroplastsmitochondriaUnassigned.qza \
--p-min-frequency $var \
--o-filtered-table $PWDa/dada2/dada2-tablenochloroplastsmitochondriaUnassigned$var.qza

qiime feature-table summarize \
--i-table $PWDa/dada2/dada2-tablenochloroplastsmitochondriaUnassigned$var.qza \
--o-visualization $PWDa/dada2/dada2-tablenochloroplastsmitochondriaUnassigned$var.qzv \
--m-sample-metadata-file $PWDa/metadataV34.txt