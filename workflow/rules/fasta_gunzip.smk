rule fasta_gzip:
    input:
        "results/{biosample_ID}/02_{biosample_ID}_megahit_contigs.fasta"
    output:
        "results/{biosample_ID}/02_{biosample_ID}_megahit_contigs.fasta.gz"
    log:
        logO="logs/fasta_gzip/{biosample_ID}.log",
        logE="logs/fasta_gzip/{biosample_ID}.err.log",
    shell:
        """
        gzip -c {input[0]} > {output[0]} 2> {log.logE}
        """
