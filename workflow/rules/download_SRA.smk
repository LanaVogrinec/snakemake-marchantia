
# rule to download data from SRA
rule download_SRA:
    output:
        "resources/SRA/{accession}/{accession}_1.fastq.gz",
        "resources/SRA/{accession}/{accession}_2.fastq.gz"
    log:
        logO="logs/download/{accession}.log",
        logE="logs/download/{accession}.err.log",
    conda:
        "../envs/sra_env.yaml"
    threads: 6
    shell:
        """
        (
        echo "Downloading data for {wildcards.accession}..."
        mkdir -p resources/SRA/{wildcards.accession} &&
        fasterq-dump {wildcards.accession} -O temp/{wildcards.accession} &&
        gzip -c temp/{wildcards.accession}/{wildcards.accession}_1.fastq > resources/SRA/{wildcards.accession}/{wildcards.accession}_1.fastq.gz &&
        gzip -c temp/{wildcards.accession}/{wildcards.accession}_2.fastq > resources/SRA/{wildcards.accession}/{wildcards.accession}_2.fastq.gz &&
        rm -rf temp/{wildcards.accession}
        ) > {log.logO} 2> {log.logE}
        """

