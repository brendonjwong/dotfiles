{:user {:plugins [[org.clojure/clojure "1.11.1"]
                  [lein-ancient "1.0.0-RC3"]
                  [lein-hiera "1.1.0"]
                  [lein-monolith "1.1.0"]
                  [lein-pprint "1.3.2"]
                  [mvxcvi/lein-cljfmt "0.7.0-SNAPSHOT"]
                  [mvxcvi/whidbey "2.2.1"]]
        :dependencies [[hashp "0.2.1"]]
        :middleware [whidbey.plugin/repl-pprint]}

 :dev {:dependencies [[reloaded.repl "0.2.4"]]}

 :my/repl ^:repl {:dependencies [[cider/cider-nrepl "0.28.5"]]
                  :injections [(require 'hashp.core)]
                  :repl-options {:nrepl-middleware
                                 [cider.nrepl/wrap-apropos
                                  cider.nrepl/wrap-classpath
                                  cider.nrepl/wrap-clojuredocs
                                  cider.nrepl/wrap-complete
                                  cider.nrepl/wrap-debug
                                  cider.nrepl/wrap-format
                                  cider.nrepl/wrap-info
                                  cider.nrepl/wrap-inspect
                                  cider.nrepl/wrap-macroexpand
                                  cider.nrepl/wrap-ns
                                  cider.nrepl/wrap-spec
                                  cider.nrepl/wrap-profile
                                  cider.nrepl/wrap-refresh
                                  cider.nrepl/wrap-resource
                                  cider.nrepl/wrap-stacktrace
                                  cider.nrepl/wrap-test
                                  cider.nrepl/wrap-trace
                                  cider.nrepl/wrap-out
                                  cider.nrepl/wrap-undef
                                  cider.nrepl/wrap-version
                                  cider.nrepl/wrap-xref]}}}
