qiime feature-classifier classify-sklearn \
--p-n-jobs 1 \
--p-reads-per-batch 1000 \
--i-classifier $PWDb/Silva138V3V4-classifier.qza \
--i-reads $PWDa/dada2/dada2-rep-seqs.qza \
--p-confidence 0.8 \
--o-classification $PWDa/dada2/Silva138V3V4-taxonomy-dada2.qza

qiime metadata tabulate \
--m-input-file $PWDa/dada2/Silva138V3V4-taxonomy-dada2.qza \
--o-visualization $PWDa/dada2/Silva138V3V4-taxonomy-dada2.qzv

qiime feature-table filter-features \
--i-table $PWDa/dada2/dada2-table.qza \
--m-metadata-file $PWDa/dada2/Silva138V3V4-taxonomy-dada2.qza \
--p-where "Taxon NOT LIKE '%Chloroplast%'" \
--o-filtered-table $PWDa/dada2/dada2-tablenochloroplasts.qza

qiime feature-table filter-features \
--i-table $PWDa/dada2/dada2-tablenochloroplasts.qza \
--m-metadata-file $PWDa/dada2/Silva138V3V4-taxonomy-dada2.qza \
--p-where "Taxon NOT LIKE '%Mitochondria%'" \
--o-filtered-table $PWDa/dada2/dada2-tablenochloroplastsmitochondria.qza

qiime feature-table filter-features \
--i-table $PWDa/dada2/dada2-tablenochloroplastsmitochondria.qza \
--m-metadata-file $PWDa/dada2/Silva138V3V4-taxonomy-dada2.qza \
--p-where "Taxon NOT LIKE '%Unassigned%'" \
--o-filtered-table $PWDa/dada2/dada2-tablenochloroplastsmitochondriaUnassigned.qza

qiime feature-table summarize \
--i-table $PWDa/dada2/dada2-tablenochloroplastsmitochondriaUnassigned.qza \
--o-visualization $PWDa/dada2/dada2-tablenochloroplastsmitochondriaUnassigned.qzv \
--m-sample-metadata-file $PWDa/metadataV34.txt