# IMPORTANT: you need to  meyer@milex:~/droso-analysis/data/raw/uniprot-blast/results$ cat *.fasta > all_sequence.fasta
# in order to be able to do that
import pandas as pd
import sys
import math
try:
    sys.path.append('~/droso-analysis/src/')
    from Generate_Exon_Map_4 import *
except:
    pass

if __name__ == "__main__":
    ID_file = pd.read_csv(sys.argv[1], sep="\t")
    my_CDS = fasta2List(sys.argv[2])
    Prot_list = fasta2List(sys.argv[3])

# Dataframe pour CDS
    CDS_ensembl_key = []
    CDS_uniprot_key = []
    CDS_seq = []
    for key, val in my_CDS.items():
        myKey = key[1:].split(" ")
        CDS_ensembl_key.append(myKey[0])
        CDS_uniprot_key.append(myKey[1])
        CDS_seq.append(val)
    dict = {"CDS_ensembl_key": CDS_ensembl_key,
            "CDS_uniprot_key": CDS_uniprot_key, "CDS_seq": CDS_seq}
    df_CDS = pd.DataFrame(dict)

# Dataframe pour Protein
    uniprot_ID = []
    uniprot_Seq = []
    for key, val in Prot_list.items():
        myKey = key[1:].split("_")
        uniprot_ID.append(myKey[0])
        uniprot_Seq.append(val)
    dict = {"uniprot_ID": uniprot_ID, "uniprot_Seq": uniprot_Seq}
    df_prot = pd.DataFrame(dict)

# On cherche les correspondance de taille
    f = open(sys.argv[4], "w")
    f.write("From\tTo\n")
    for index, row in ID_file.iloc[:, :].iterrows():
        try:
            CDS = df_CDS.loc[df_CDS["CDS_ensembl_key"] == row[1]].iloc[0, 2]
            prot = df_prot.loc[df_prot["uniprot_ID"] == row[0]].iloc[0, 1]
        except:
            continue

        if (math.ceil((len(CDS)-3)/3) == len(prot)) or (math.floor((len(CDS)-3)/3) == len(prot)) or (len(CDS)/3 == len(prot)):
            f.write(row[0] + "\t" + row[1]+"\n")

    f.close()
