rule megan_meganizer:
    input:
        "results/{accession}/03_{accession}_megahit_diamond.daa",
    output:
        "results/{accession}/04_{accession}_meganizer.daa",
    log:
        logO="logs/megan_meganizer/{accession}.log",
        logE="logs/megan_meganizer/{accession}.err.log",
    benchmark:
        "results/{accession}/04_{accession}_benchmark_meganizer.txt"
    conda:
<<<<<<< HEAD
        "../envs/diamond-megan.yaml"
    threads: 40
=======
        "../envs/megan_env.yaml"
    threads: 3
>>>>>>> edec49089aa13d94fd104b786797fb906496cb3c
    shell:
        """
        cp {input} {output}
        if [[ $(diamond view --daa {output} | wc -l) -ge 1 ]]; then
            daa-meganizer --threads {threads} -i {output} -mdb /home/clc/Documents/MEGAN6_database/megan-map-Feb2022.db -supp 0 > {log.logO} 2> {log.logE}
        fi
        """


