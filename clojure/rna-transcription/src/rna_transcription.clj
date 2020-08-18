(ns rna-transcription)

(defn to-rna [dna-strand]
  (let [rna-transcription {\G \C \C \G \T \A \A \U}
        rna-nucleotides (map #(rna-transcription %1) dna-strand)]
    (if (not-every? char? rna-nucleotides)
      (throw (AssertionError. "Invalid DNA strand"))
      (apply str rna-nucleotides))))
