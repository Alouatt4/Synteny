#########################################################
##################### Synteny MRJPs #####################
#########################################################

install.packages("RIdeogram")
require(RIdeogram)

## bombus terrestris ##
#blast -> nucleotides
#  -> see: "Length" of Chromosome/Scaffold
#design 12 chromosomes (better edit)
karyotype = read.table("BTER_mrjp-yellow_loc.txt", sep= "\t", header = T, 
                       stringsAsFactors = F)

head(karyotype)

ideogram(karyotype = karyotype)
bter_annot = read.table("BTER_mrjp-yellow_loc_genes_annot.txt", sep = "\t", header = T,
                        stringsAsFactors = F)

head (bter_annot)

btergene <- GFFex(input = "Bombus_terrestris_Bter_1.0_AR102_RefSeq_proteincoding.gff3",
                  karyotype = "BTER_mrjp-yellow_loc.txt", feature = "gene", window = 4000)

head (btergene)

ideogram(karyotype = karyotype, overlaid = btergene)
ideogram(karyotype = karyotype, overlaid = btergene,
         label= bter_annot, label_type = "mark")


ideogram(karyotype = karyotype, overlaid = btergene,
         label = bter_annot, label_type = "marker", Lx = 190, Ly = 35)
#Lx / Ly - upper-left point and the left margin; upper-left point and the upper margin
convertSVG("chromosome.svg", device = "png", width = 10, height=10, dpi=600)

## end ##