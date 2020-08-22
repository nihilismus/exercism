(ns anagram
  (:require [clojure.string :as str]))

(defn anagram-for? [lowercased-word sorted-word prospect]
  (let [lowercased-prospect (str/lower-case prospect)
        sorted-prospect (sort lowercased-prospect)]
    (and (not= lowercased-prospect lowercased-word)
         (= sorted-prospect sorted-word))))

(defn anagrams-for [word prospect-list]
  (let [lowercased-word (str/lower-case word)
        sorted-word (sort lowercased-word)]
    (filter #(anagram-for? lowercased-word sorted-word %1)
            prospect-list)))
