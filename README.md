
# Smaple
The image data and CSV feature file samples of experiment batch 17 are stored in the `0_sample` folder.

# LDA-based Analysis
Based on LDA supervised training, the drug phenotypic feature values are calculated. The specific code is stored in `1_LDAAnalysis`.


# PT score calculation
By combining the fluorescence resonance energy transfer (FRET) characterization values with the phenotypic characterization values, the therapeutic potential (PT) score of single-cell drugs is calculated. The specific code is located in the `2_PTScoreAnalysis` folder.

# PT curve fitting
The PT score calculated will be combined with the concentration to obtain the concentration-effect curve for evaluating the drug's efficacy. The specific code is shown in the `3_PTCurveAnalysis` folder.

# FRET-HCI Database
Core reference data including raw FRET microscope data images can be downloaded in BioImage Archive[39] under accession codes S-BIAD2398 for MCF7 cells co-expressing BCL-XL and BAK, S-BIAD2403 for MCF7 cells co-expressing BCL-2 and BAK, S-BIAD2406 for A549 cells co-expressing EGFR and GRB2, and S-BIAD2406 for H1975 cells co-expressing EGFR and GRB2.
