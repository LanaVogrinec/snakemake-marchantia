rule fastq_gzip:
    input:
        "resources/SRA/{biosample_ID}/{biosample_ID}_1.fastq",
        "resources/SRA/{biosample_ID}/{biosample_ID}_2.fastq"
    output:
        "resources/SRA/{biosample_ID}/{biosample_ID}_1.fastq.gz",
        "resources/SRA/{biosample_ID}/{biosample_ID}_2.fastq.gz"
    log:
        logO="logs/gzip/{biosample_ID}.log",
        logE="logs/gzip/{biosample_ID}.err.log",
    shell:
        """
        gzip -c {input[0]} > {output[0]} && gzip -c {input[1]} > {output[1]} && rm {input} > {log.logO} 2> {log.logE}
        """
