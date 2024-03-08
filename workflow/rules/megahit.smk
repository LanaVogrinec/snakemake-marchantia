rule megahit:
    input:
        r1="results/{accession}/01_{accession}_trim_1_paired.fq.gz",
        r2="results/{accession}/01_{accession}_trim_2_paired.fq.gz",
    output:
        d=temp(directory("results/{accession}/{accession}_megahit")),
        f="results/{accession}/02_{accession}_megahit_contigs.fasta",
    log:
        logO="logs/megahit/{accession}.log",
        logE="logs/megahit/{accession}.err.log",
    conda:
        "../envs/megahit_env.yaml"
    threads: 20
    shell:
        """
        megahit -t {threads} -1 {input.r1} -2 {input.r2} -o {output.d} > {log.logO} 2> {log.logE}
        cp {output.d}/final.contigs.fa {output.f}

        """


