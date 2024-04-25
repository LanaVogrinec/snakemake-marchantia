rule megan_export:
    input:
        "results/{accession}/04_{accession}_meganizer.daa",
    output:
        taxon="results/{accession}/05_{accession}_meganizer_read_classification.tsv",
        class_count="results/{accession}/05_{accession}_meganizer_class_count.tsv",
    log:
        logO="logs/megan_export/{accession}.log",
        logE="logs/megan_export/{accession}.err.log",
    conda:
        "../envs/diamond-megan.yaml"
    shell:
        """
        daa2info -i {input} -r2c Taxonomy -p -o {output.taxon} > {log.logO} 2> {log.logE}
        daa2info -i {input} -c2c Taxonomy -p -o {output.class_count} >> {log.logO} 2>> {log.logE}
        """