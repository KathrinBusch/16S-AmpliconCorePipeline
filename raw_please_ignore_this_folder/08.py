qiime dada2 denoise-single \
--i-demultiplexed-seqs $PWDa/dada2/single-end-demux.qza \
--p-trim-left 0 \
--p-trunc-len 270 \
--p-chimera-method consensus \
--p-n-threads 0 \
--p-n-reads-learn 1000000 \
--o-table $PWDa/dada2/dada2-table.qza \
--o-representative-sequences $PWDa/dada2/dada2-rep-seqs.qza \
--o-denoising-stats $PWDa/dada2/dada2-denoising-stats.qza

qiime metadata tabulate \
--m-input-file $PWDa/dada2/dada2-denoising-stats.qza \
--o-visualization $PWDa/dada2/dada2-denoising-stats.qzv

qiime feature-table summarize \
--i-table $PWDa/dada2/dada2-table.qza \
--o-visualization $PWDa/dada2/dada2-table.qzv \
--m-sample-metadata-file $PWDa/metadataV34.txt