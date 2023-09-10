#########################################################
##################### Synteny MRJPs #####################
#########################################################

install.packages("RIdeogram")
require(RIdeogram)

## Apis ##
#design 12 chromosomes (better edit)
karyotype = read.table("Amel_mrjp-yellow_loc.txt", sep= "\t", header = T, 
                       stringsAsFactors = F)

head(karyotype)


ideogram(karyotype = karyotype)
amel_annot = read.table("Amel_mrjp-yellow_loc_genes_annot.txt", sep = "\t", header = T,
                        stringsAsFactors = F)

head (amel_annot)

amelgene <- GFFex(input = "Amel-3.1-GCF_003254395.2_Amel_HAv3.1_genomic.gff", 
                  karyotype = "Amel_mrjp-yellow_loc.txt", feature = "gene", window = 4000)

head (amelgene)

# ideogram(karyotype = karyotype, overlaid = amelgene)
ideogram(karyotype = karyotype, overlaid = amelgene, 
         label= amel_annot, label_type = "mark")


ideogram(karyotype = karyotype, overlaid = amelgene, 
         label = amel_annot, label_type = "marker", Lx = 190, Ly = 35)
convertSVG("chromosome.svg", device = "png", width = 25, height= 25, dpi=600)