{:user {:dependencies [[slamhound "RELEASE"]
                       [org.clojure/tools.trace "RELEASE"]]
        :aliases {"slamhound" ["run" "-m" "slam.hound"]}
        :plugins [[lein-kibit "RELEASE"]]
        :jvm-opts ["-Xverify:none"]}}
