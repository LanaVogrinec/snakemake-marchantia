rule diamond:
    input:
<<<<<<< HEAD
        "results/{biosample_ID}/02_{biosample_ID}_megahit_contigs.fasta",
    output:
        "results/{biosample_ID}/03_{biosample_ID}_megahit_diamond.daa",
    log:
        logO="logs/diamond/{biosample_ID}.log",
        logE="logs/diamond/{biosample_ID}.err.log",
    benchmark:
        "results/{biosample_ID}/03_{biosample_ID}_benchmark_megahit_diamond.txt",
    conda:
        "../envs/diamond-megan.yaml"
    threads: 60
    shell:
        """
        diamond blastx --threads {threads} -d /DATA/PHEW/databases/diamond_20240405_v.0.9.14/nr.dmnd -k 20 -q {input} --daa {output} > {log.logO} 2> {log.logE}
=======
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
>>>>>>> edec49089aa13d94fd104b786797fb906496cb3c
        """