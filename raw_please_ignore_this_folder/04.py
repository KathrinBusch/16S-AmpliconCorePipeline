qiime tools import \
--type 'SampleData[SequencesWithQuality]' \
--input-path $PWDa/pre-33-manifestV34.csv \
--output-path $PWDa/dada2/single-end-demux.qza \
--input-format SingleEndFastqManifestPhred33

qiime demux summarize \
--i-data $PWDa/dada2/single-end-demux.qza \
--o-visualization $PWDa/dada2/single-end-demux.qzv