qiime tools import \
--type 'FeatureData[Sequence]' \
--input-path silva_138_99.fasta \
--output-path silva_138_99.qza

qiime tools import \
--type 'FeatureData[Taxonomy]' \
--input-format HeaderlessTSVTaxonomyFormat \
--input-path taxonomy_7_levels.txt \
--output-path silva138-ref-taxonomy.qza

qiime feature-classifier extract-reads \
--i-sequences silva_138_99.qza \
--p-f-primer CCTACGGGAGGCAGCAG \
--p-r-primer GGACTACHVGGGTWTCTAAT \
--o-reads silva138V3V4-ref-seqs.qza

qiime feature-classifier fit-classifier-naive-bayes \
--i-reference-reads silva138V3V4-ref-seqs.qza \
--i-reference-taxonomy silva138-ref-taxonomy.qza \
--o-classifier Silva138V3V4-classifier.qza
