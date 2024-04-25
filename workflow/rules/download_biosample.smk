rule download_biosample:
    input:
        "workflow/biosample_ID.txt"
    output:
        touch("downloaded_files.txt")
    conda:
        "../envs/sra_env.yaml"
    shell:
        """
        workflow/scripts/download_biosample.sh > downloaded_files.txt 
        """

