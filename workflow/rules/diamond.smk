rule diamond:
    input:
        "results/{accession}/02_{accession}_megahit_contigs.fasta",
    output:
        "results/{accession}/03_{accession}_megahit_diamond.daa",
    log:
        logO="logs/diamond/{accession}.log",
        logE="logs/diamond/{accession}.err.log",
    benchmark:
        "results/{accession}/03_{accession}_benchmark_megahit_diamond.txt",
    conda:
        "../envs/diamond_env.yaml"
    threads: 60
    shell:
        """
        diamond blastx --threads {threads} -d /DATA/PHEW/databases/diamond_20240703/nr.dmnd -k 20 -q {input} --daa {output} > {log.logO} 2> {log.logE}
        """