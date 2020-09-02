(ns word-count
  (:require [clojure.string :as str]))

(defn word-count [string]
  (->> string
    (str/lower-case)
    (re-seq #"\w+")
    (frequencies)))
