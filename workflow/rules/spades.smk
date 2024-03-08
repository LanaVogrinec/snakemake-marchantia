rule spades:
    input:
        r1="results/{accession}/01_{accession}_trim_1_paired.fq.gz",
        r2="results/{accession}/01_{accession}_trim_2_paired.fq.gz",
    output:
        d=temp(directory("results/{accession}/{accession}_spades")),
        f="results/{accession}/02_{accession}_spades_contigs.fasta",
    log:
        logO="logs/spades/{accession}.log",
        logE="logs/spades/{accession}.err.log",
    conda:
        "../envs/spades_env.yaml"
    threads: 40
    shell:
        """
        rnaviralspades.py -t {threads} -1 {input.r1} -2 {input.r2} -o {output.d} > {log.logO} 2> {log.logE}
        cp {output.d}/contigs.fasta {output.f}

        """
