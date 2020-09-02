(ns anagram
  (:require [clojure.string :as str]))

(defn- anagram-for? [s]
  (let [ls (str/lower-case s)
        sls (sort ls)]
    #(let [lprospect (str/lower-case %)
           slprospect (sort lprospect)]
       (and (not= lprospect ls)
            (= slprospect sls)))))

(defn anagrams-for [word prospects]
  (filter (anagram-for? word) prospects))
