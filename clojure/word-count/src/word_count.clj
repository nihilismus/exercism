(ns word-count
  (:require [clojure.string :as str]))

(defn normalize [string]
  (-> string
      (str/lower-case)
      (str/split #"\W+")))

(defn word-count [string]
  (let [normalized (normalize string)]
    (frequencies normalized)))
