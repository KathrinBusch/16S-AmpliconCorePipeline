qiime taxa collapse \
 --i-table $PWDa/dada2/dada2-tablenochloroplastsmitochondriaUnassigned$var.qza \
 --i-taxonomy $PWDa/dada2/Silva138V3V4-taxonomy-dada2.qza \
--p-level 7 \
--output-dir taxtable

qiime tools export \
--input-path $PWDa/R/taxtable/collapsed_table.qza \
--output-path $PWDa/R/taxtable/collapsed_table
