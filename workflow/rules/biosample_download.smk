rule biosample_download:
    input:
        "biosample_IDs.txt"
    output:
        directory("{biosample_id}")
    shell:
        """
        while read -r BIOSAMPLE_ID SRRLIST; do
            mkdir -p "$BIOSAMPLE_ID"
            for SRR in $SRRLIST; do
                fasterq-dump --outdir "$BIOSAMPLE_ID" "$SRR"
            done

            cd "$BIOSAMPLE_ID" || exit

            cat *_1.fastq > "${BIOSAMPLE_ID}_1.fastq"
            cat *_2.fastq > "${BIOSAMPLE_ID}_2.fastq"

            for file in *_1.fastq; do
                if [ "$file" != "${BIOSAMPLE_ID}_1.fastq" ]; then
                    rm "$file"
                fi
            done

            for file in *_2.fastq; do
                if [ "$file" != "${BIOSAMPLE_ID}_2.fastq" ]; then
                    rm "$file"
                fi
            done

            cd ..
        done < {input}
        """
