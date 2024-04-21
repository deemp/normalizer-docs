!constant IMPORTS "Imports"
!constant USES_FUNCTIONS_FROM "Uses functions from"

workspace {

    !identifiers hierarchical

    model {
        user = person "Developer" {
            description "Develops Java applications."
            tags "Developer"
        }
        
        maven = softwareSystem "Maven" {
            description "Build tool for Java projects."

            tags "Application"
        }
                    
        filesystem = softwareSystem "File System" {
            description "Stores files."
            
            tags "File System"
            
            group "Apache Maven JAR Plugin outputs" {
                javaCompilerOutput = container "jar:jar output" {
                    description "Java bytecode"
                    tags "File System"
                    technology "Files"
                }
            }
            
            group "Intermediate optimization outputs" {
                jeoDisassembleOutput = container "jeo:disassemble output" {
                    description "XMIR files"
                    tags "File System"
                    technology "Files"
                }
                opeoDecompileOutput = container "opeo:decompile output" {
                    description "XMIR files with high-level EO code"
                    tags "File System"
                    technology "Files"
                }
                eoPhiOutput = container "eo:phi output" {
                    description "PHI code"
                    tags "File System"
                    technology "Files"
                }
                normReduceOutput = container "norm:reduce output" {
                    description "PHI code"
                    tags "File System"
                    technology "Files"
                }
                ineoFuseOutput = container "ineo:fuse output" {
                    description "PHI code"
                    tags "File System"
                    technology "Files"
                }
                eoUnphiOutput = container "eo:unphi output" {
                    description "XMIR files with high-level EO code"
                    tags "File System"
                    technology "Files"
                }
                opeoCompileOutput = container "opeo:compile output" {
                    description "XMIR files with low-level EO code"
                    tags "File System"
                    technology "Files"
                }
            }
            
            group "Final optimization outputs" {
                xmirToBytecodeOutput = container "jeo:xmir-to-bytecode output" {
                    description "Java bytecode"
                    tags "File System"
                    technology "Files"
                }
            }
        }
        
        orgEolang = softwareSystem "org.eolang" {
            description "A collection of Java packages for the EO Programming Language"
            
            tags "Java package"
            
            eoMavenPlugin = container "eo-maven-plugin" {
                description "Implements functionality for parsing, compiling, transpiling, optimizing, linking, dataizing, and running EO code."
                
                technology "Maven plugin"
                tags "Maven plugin"
                
                eoParser = component "eo-parser" {
                    description "Parses EO code into XMIR"
                    technology "Java package"
                    tags "Java package"
                }
                
                eoRuntime = component "eo-runtime" {
                    description "Runtime for EO"
                    technology "Java package"
                    tags "Java package"
                }
            }
        }
        
        eoc = softwareSystem "eoc" {
            description "Command-line toolkit for working with EO code."
            
            tags "Application"
            
            group "commands" {
                container "register"{
                    description "Finds necessary EO files and registers them in a JSON catalog"
                    tags "Command"
                }
                container "assemble" {
                    description "Parses EO files into XMIR, optimizes them, and pulls foreign EO objects"
                    tags "Command"
                }
            }
            
            -> orgEolang.eoMavenPlugin "Uses"
        }
        
        normalizer = softwareSystem normalizer {
            description "Command-line normalizer of PHI code"
            tags "Application"
            
            modules = container modules {
                tags "Haskell module"
                
                Main = component Main {
                    description "Command-line interface"
                    tags "Haskell module"
                    technology "Haskell module"
                }
                Language_EO_Phi_Metrics_Data = component "Language.EO.Phi.Metrics.Data" {
                    description "Types and instances for metrics collection"
                    tags "Haskell module"
                    technology "Haskell module"
                }
                Language_EO_Phi_Metrics_Collect = component "Language.EO.Phi.Metrics.Collect" {
                    description "Functions for collecting metrics for a given PHI expression"
                    tags "Haskell module"
                    technology "Haskell module"
                }
                Language_EO_Phi_Report_Data = component "Language.EO.Phi.Report.Data" {
                    description "Types, instances, functions for report data manipulation"
                    tags "Haskell module"
                    technology "Haskell module"
                }
                Language_EO_Phi_Report_Html = component "Language.EO.Phi.Report.Html" {
                    description "Functions for rendering a report to HTML"
                    tags "Haskell module"
                    technology "Haskell module"
                }
                Language_EO_Phi_Rules_Common = component "Language.EO.Phi.Rules.Common" {
                    description "Helper functions for working with rules and rule files"
                    tags "Haskell module"
                    technology "Haskell module"
                }
                Language_EO_Phi_Rules_Yaml = component "Language.EO.Phi.Rules.Yaml" {
                    description "Types and functions for working with user-defined rules"
                    tags "Haskell module"
                    technology "Haskell module"
                }
                Language_EO_Phi_Syntax_Abs = component "Language.EO.Phi.Syntax.Abs" {
                    description "Types for constructing an abstract syntax tree of PHI expressions"
                    tags "Haskell module"
                    technology "Haskell module"
                }
                Language_EO_Phi_Syntax_Lex = component "Language.EO.Phi.Syntax.Lex" {
                    description "Types and functions for lexing"
                    tags "Haskell module"
                    technology "Haskell module"
                }
                Language_EO_Phi_Syntax_Par = component "Language.EO.Phi.Syntax.Par" {
                    description "Types and functions for parsing programs"
                    tags "Haskell module"
                    technology "Haskell module"
                }
                Language_EO_Phi_Syntax_Print = component "Language.EO.Phi.Syntax.Print" {
                    description "Generated functions for pretty-printing PHI expressions"
                    tags "Haskell module"
                    technology "Haskell module"
                }
                Language_EO_Phi_Dataize = component "Language.EO.Phi.Dataize" {
                    description "Functions for dataization"
                    tags "Haskell module"
                    technology "Haskell module"
                }
                Language_EO_Phi_Syntax = component "Language.EO.Phi.Syntax" {
                    description "Functions for pretty-printing of PHI expressions"
                    tags "Haskell module"
                    technology "Haskell module"
                }
                Language_EO_Phi = component "Language.EO.Phi" {
                    description "Helper functions for parsing programs"
                    tags "Haskell module"
                    technology "Haskell module"
                }
            }
            
            modules.Language_EO_Phi_Metrics_Data -> modules.Language_EO_Phi_Rules_Common "${IMPORTS}"
            
            modules.Language_EO_Phi_Metrics_Collect -> modules.Language_EO_Phi_Rules_Common "${IMPORTS}"
            modules.Language_EO_Phi_Metrics_Collect -> modules.Language_EO_Phi_Metrics_Data "${IMPORTS}"
            modules.Language_EO_Phi_Metrics_Collect -> modules.Language_EO_Phi_Syntax_Abs "${IMPORTS}"
            
            modules.Language_EO_Phi_Report_Data -> modules.Language_EO_Phi_Metrics_Data "${IMPORTS}"
            
            modules.Language_EO_Phi_Report_Html -> modules.Language_EO_Phi_Metrics_Data "${IMPORTS}"
            modules.Language_EO_Phi_Report_Html -> modules.Language_EO_Phi_Report_Data "${IMPORTS}"
            
            modules.Language_EO_Phi_Rules_Common -> modules.Language_EO_Phi_Syntax_Abs "${IMPORTS}"
            modules.Language_EO_Phi_Rules_Common -> modules.Language_EO_Phi_Syntax_Lex "${IMPORTS}"
            modules.Language_EO_Phi_Rules_Common -> modules.Language_EO_Phi_Syntax_Par "${IMPORTS}"
            
            modules.Language_EO_Phi_Rules_Yaml -> modules.Language_EO_Phi_Rules_Common "${IMPORTS}"
            modules.Language_EO_Phi_Rules_Yaml -> modules.Language_EO_Phi_Syntax_Abs "${IMPORTS}"
            modules.Language_EO_Phi_Rules_Yaml -> modules.Language_EO_Phi "${IMPORTS}"
            
            modules.Language_EO_Phi_Dataize -> modules.Language_EO_Phi "${IMPORTS}"
            modules.Language_EO_Phi_Dataize -> modules.Language_EO_Phi_Rules_Common "${IMPORTS}"
            modules.Language_EO_Phi_Dataize -> modules.Language_EO_Phi_Syntax_Abs "${IMPORTS}"
            
            modules.Language_EO_Phi_Syntax -> modules.Language_EO_Phi_Rules_Common "${IMPORTS}"
            modules.Language_EO_Phi_Syntax -> modules.Language_EO_Phi_Syntax_Abs "${IMPORTS}"
            modules.Language_EO_Phi_Syntax -> modules.Language_EO_Phi_Syntax_Print "${IMPORTS}"
            
            modules.Language_EO_Phi -> modules.Language_EO_Phi_Syntax_Print "${IMPORTS}"
            modules.Language_EO_Phi -> modules.Language_EO_Phi_Syntax_Abs "${IMPORTS}"
            modules.Language_EO_Phi -> modules.Language_EO_Phi_Syntax_Par "${IMPORTS}"
            
            modules.Main -> modules.Language_EO_Phi "${IMPORTS}"
            modules.Main -> modules.Language_EO_Phi_Dataize "${IMPORTS}"
            modules.Main -> modules.Language_EO_Phi_Metrics_Collect "${IMPORTS}"
            modules.Main -> modules.Language_EO_Phi_Metrics_Data "${IMPORTS}"
            modules.Main -> modules.Language_EO_Phi_Report_Data "${IMPORTS}"
            modules.Main -> modules.Language_EO_Phi_Report_Html "${IMPORTS}"
            modules.Main -> modules.Language_EO_Phi_Rules_Common "${IMPORTS}"
            modules.Main -> modules.Language_EO_Phi_Rules_Yaml "${IMPORTS}"
            
            metrics = container metrics {
                description "Calculate metrics for a PHI program"
                technology "Command"
                tags "Command"
                
                -> modules.Main "Implemented in"
                -> modules.Language_EO_Phi "${USES_FUNCTIONS_FROM}"
                -> modules.Language_EO_Phi_Metrics_Collect "${USES_FUNCTIONS_FROM}"
                -> modules.Language_EO_Phi_Metrics_Data "${USES_FUNCTIONS_FROM}"
            }
            transform = container transform {
                description "Rewrite PHI code to a normal form"
                technology "Command"
                tags "Command"
                
                -> modules.Main "Implemented in"
                -> modules.Language_EO_Phi "${USES_FUNCTIONS_FROM}"
                -> modules.Language_EO_Phi_Rules_Common "${USES_FUNCTIONS_FROM}"
                -> modules.Language_EO_Phi_Rules_Yaml "${USES_FUNCTIONS_FROM}"
            }
            dataize = container dataize {
                description "Dataize PHI code"
                technology "Command"
                tags "Command"
                
                -> modules.Main "Implemented in"
                -> modules.Language_EO_Phi "${USES_FUNCTIONS_FROM}"
                -> modules.Language_EO_Phi_Rules_Common "${USES_FUNCTIONS_FROM}"
                -> modules.Language_EO_Phi_Rules_Yaml "${USES_FUNCTIONS_FROM}"
                -> modules.Language_EO_Phi_Dataize "${USES_FUNCTIONS_FROM}"
            }
            report = container report {
                description "Generate a report for given PHI programs"
                technology "Command"
                tags "Command"
                
                -> modules.Main "Implemented in"
                -> modules.Language_EO_Phi "${USES_FUNCTIONS_FROM}"
                -> modules.Language_EO_Phi_Report_Data "${USES_FUNCTIONS_FROM}"
                -> modules.Language_EO_Phi_Report_Html "${USES_FUNCTIONS_FROM}"
            }
        }
        
        // TODO calls compiler with parameters using maven
        
        // TODO(presentation) why this tool?
        // why haskell

        
        optimizationPlugin = softwareSystem "Maven plugin for Java bytecode optimization" {
            description "Processes and optimizes Java bytecode."
            
            tags "Maven plugin"
            
            // Maven goals are denoted as containers because they're separately deployable.
            // E.g., one can run a part of the pipeline.
            // > Essentially, a container is a separately runnable/deployable unit (e.g. a separate process space) that executes code or stores data. - [link](https://c4model.com/)
            
            jeoDisassemble = container "jeo:disassemble" {
                description "Converts Java bytecode binary files to XMIR files with low-level EO code that has `opcode` atoms."
                technology "Maven goal"
                tags "Maven Goal"
            }
      
            opeoDecompile = container "opeo:decompile" {
                description "Takes XMIR files with low-level EO code and transforms combinations of `opcode` atoms into EO objects. Produces XMIR files with high-level EO code."
                technology "Maven goal"
                tags "Maven Goal"
            }
      
            eoPhi = container "eo:xmir-to-phi" {
                description "Converts XMIR files with high-level EO code to files with PHI code."
                technology "Maven goal"
                tags "Maven Goal"
                
                -> orgEolang.eoMavenPlugin "Uses"
            }
            
            normReduce = container "norm:reduce" {
                description "Evaluates and rewrites PHI code."
                technology "Maven goal"
                tags "Maven Goal"
                
                -> normalizer "Uses"
            }
            
            ineoFuse = container "ineo:fuse" {
                description "Optimizes PHI code."
                technology "Maven goal"
                tags "Maven Goal"
            }
            
            eoUnphi = container "eo:phi-to-xmir" {
                description "Converts PHI code to XMIR files with high-level EO code."
                technology "Maven goal"
                tags "Maven Goal"
                
                -> orgEolang.eoMavenPlugin "Uses"
            }
                        
            opeoCompile = container "opeo:compile" {
                description "Converts XMIR files with high-level EO code to XMIR files with low-level EO code."
                technology "Maven goal"
                tags "Maven Goal"
            }
            
            xmirToBytecode = container "jeo:xmir-to-bytecode" {
                description "Converts XMIR files with low-level EO code to Java bytecode."
                technology "Maven goal"
                tags "Maven Goal"
            }
            

            // TODO
            // sets arguments for normalizer
            // writes files
            // TODO add "uses EO compiler"
            
            jeoDisassemble_javaCompilerOutput = jeoDisassemble -> filesystem.javaCompilerOutput "Reads"
            jeoDisassemble_jeoDisassembleOutput = jeoDisassemble -> filesystem.jeoDisassembleOutput "Writes"
            opeoDecompile_jeoDisassembleOutput = opeoDecompile -> filesystem.jeoDisassembleOutput "Reads"
            opeoDecompile_opeoDecompileOutput = opeoDecompile -> filesystem.opeoDecompileOutput "Writes"
            eoPhi_opeoDecompileOutput = eoPhi -> filesystem.opeoDecompileOutput "Reads"
            eoPhi_eoPhiOutput = eoPhi -> filesystem.eoPhiOutput "Writes"
            normReduce_eoPhiOutput = normReduce -> filesystem.eoPhiOutput "Reads"
            normReduce_normReduceOutput = normReduce -> filesystem.normReduceOutput "Writes"
            ineoFuse_normReduceOutput = ineoFuse -> filesystem.normReduceOutput "Reads"
            ineoFuse_ineoFuseOutput = ineoFuse -> filesystem.ineoFuseOutput "Writes"
            eoUnphi_ineoFuseOutput = eoUnphi -> filesystem.ineoFuseOutput "Reads"
            eoUnphi_eoUnphiOutput = eoUnphi -> filesystem.eoUnphiOutput "Writes"
            opeoCompile_eoUnphiOutput = opeoCompile -> filesystem.eoUnphiOutput "Reads"
            opeoCompile_opeoCompileOutput = opeoCompile -> filesystem.opeoCompileOutput "Writes"
            xmirToBytecode_opeoCompileOutput = xmirToBytecode -> filesystem.opeoCompileOutput "Reads"
            xmirToBytecode_xmirToBytecodeOutput = xmirToBytecode -> filesystem.xmirToBytecodeOutput "Writes"
        }
        
        user -> maven "Uses to build and optimize Java applications"
        maven -> optimizationPlugin "Executes"
        optimizationPlugin -> filesystem "Reads from"
        optimizationPlugin -> filesystem "Writes to"
    }

    views {
        
        systemContext optimizationPlugin {
            include *
            include user
            exclude jeoDisassemble_javaCompilerOutput
            exclude jeoDisassemble_jeoDisassembleOutput
            exclude opeoDecompile_jeoDisassembleOutput
            exclude opeoDecompile_opeoDecompileOutput
            exclude eoPhi_opeoDecompileOutput
            exclude eoPhi_eoPhiOutput
            exclude normReduce_eoPhiOutput
            exclude normReduce_normReduceOutput
            exclude ineoFuse_normReduceOutput
            exclude ineoFuse_ineoFuseOutput
            exclude eoUnphi_ineoFuseOutput
            exclude eoUnphi_eoUnphiOutput
            exclude opeoCompile_eoUnphiOutput
            exclude opeoCompile_opeoCompileOutput
            exclude xmirToBytecode_opeoCompileOutput
            exclude xmirToBytecode_xmirToBytecodeOutput
            
            autolayout lr
        }        
        
        container optimizationPlugin "StaticView" {
            include optimizationPlugin.jeoDisassemble
            include optimizationPlugin.opeoDecompile
            include optimizationPlugin.eoPhi
            include optimizationPlugin.normReduce
            include optimizationPlugin.ineoFuse
            include optimizationPlugin.eoUnphi
            include optimizationPlugin.opeoCompile
            include optimizationPlugin.xmirToBytecode
            
            include filesystem.javaCompilerOutput
            include filesystem.jeoDisassembleOutput
            include filesystem.opeoDecompileOutput
            include filesystem.eoPhiOutput
            include filesystem.normReduceOutput
            include filesystem.ineoFuseOutput
            include filesystem.eoUnphiOutput
            include filesystem.opeoCompileOutput
            
            // TODO fix layout
            
            // fix: bad layout if mismatched number of elements in optimization plugin and filesystem groups
            // include filesystem.xmirToBytecodeOutput
            
            // fix: the pipeline is right-to-left
            
            autoLayout lr
        }
        
        dynamic optimizationPlugin "DynamicView" {
            title "Plugin pipeline workflow"
            
            optimizationPlugin.jeoDisassemble -> filesystem.javaCompilerOutput "Reads"
            optimizationPlugin.jeoDisassemble -> filesystem.jeoDisassembleOutput "Writes"
            optimizationPlugin.opeoDecompile -> filesystem.jeoDisassembleOutput "Reads"
            optimizationPlugin.opeoDecompile -> filesystem.opeoDecompileOutput "Writes"
            optimizationPlugin.eoPhi -> filesystem.opeoDecompileOutput "Reads"
            optimizationPlugin.eoPhi -> filesystem.eoPhiOutput "Writes"
            optimizationPlugin.normReduce -> filesystem.eoPhiOutput "Reads"
            optimizationPlugin.normReduce -> filesystem.normReduceOutput "Writes"
            optimizationPlugin.ineoFuse -> filesystem.normReduceOutput "Reads"
            optimizationPlugin.ineoFuse -> filesystem.ineoFuseOutput "Writes"
            optimizationPlugin.eoUnphi -> filesystem.ineoFuseOutput "Reads"
            optimizationPlugin.eoUnphi -> filesystem.eoUnphiOutput "Writes"
            optimizationPlugin.opeoCompile -> filesystem.eoUnphiOutput "Reads"
            optimizationPlugin.opeoCompile -> filesystem.opeoCompileOutput "Writes"
            optimizationPlugin.xmirToBytecode -> filesystem.opeoCompileOutput "Reads"
            
                    
            // TODO fix layout
            
            // fix: bad layout if mismatched number of elements in optimization plugin and filesystem groups
            // optimizationPlugin.xmirToBytecode -> filesystem.xmirToBytecodeOutput "Writes"
                        
            autoLayout lr
        }
        
        
        component normalizer.dataize {
            include normalizer.modules.Main
            include normalizer.modules.Language_EO_Phi
            include normalizer.modules.Language_EO_Phi_Rules_Common
            include normalizer.modules.Language_EO_Phi_Rules_Yaml
            include normalizer.modules.Language_EO_Phi_Dataize
            
            autoLayout lr
        }
                
        dynamic normalizer.dataize {
            title "Dataization workflow"
            
            normalizer.modules.Main -> normalizer.modules.Language_EO_Phi "Parses input program via"
            normalizer.modules.Main -> normalizer.modules.Language_EO_Phi_Rules_Yaml "Parses rules via"
            normalizer.modules.Main -> normalizer.modules.Language_EO_Phi_Rules_Common "Applies rules via"
            normalizer.modules.Main -> normalizer.modules.Language_EO_Phi_Dataize "Dataizes via"
            
            // include normalizer.modules.Main
            // include normalizer.modules.Language_EO_Phi
            // include normalizer.modules.Language_EO_Phi_Rules_Common
            // include normalizer.modules.Language_EO_Phi_Dataize
            
            autoLayout lr
        }
        
        systemContext normalizer {
            exclude optimizationPlugin
            autoLayout lr
        }
        
        container normalizer {
            include *
            autoLayout lr
        }
        
                
        component normalizer.modules {
            include *
            exclude normalizer.metrics
            exclude normalizer.report
            exclude normalizer.transform
            exclude normalizer.dataize
            autoLayout lr
        }

        
        component normalizer.metrics {
            include normalizer.modules.Main
            include normalizer.modules.Language_EO_Phi
            include normalizer.modules.Language_EO_Phi_Metrics_Collect
            include normalizer.modules.Language_EO_Phi_Metrics_Data
            
            autoLayout lr
        }
        
        component normalizer.transform {
            include normalizer.modules.Main
            include normalizer.modules.Language_EO_Phi
            include normalizer.modules.Language_EO_Phi_Rules_Common
            include normalizer.modules.Language_EO_Phi_Rules_Yaml
            
            autoLayout lr
        }
        
        component normalizer.report {
            include normalizer.modules.Main
            include normalizer.modules.Language_EO_Phi
            include normalizer.modules.Language_EO_Phi_Report_Data
            include normalizer.modules.Language_EO_Phi_Report_Html
            
            autoLayout lr
        }
        
        component optimizationPlugin.normReduce {
            include optimizationPlugin.normReduce
            include normalizer
            autoLayout lr
        }
        
        systemContext eoc "eoc" {
            include *
            autoLayout lr
        }
        
        container eoc "eoc_container" {
            include *
            autoLayout lr
        }
        
        systemContext orgEolang {
            include *
            autoLayout lr
        }
        
        container orgEolang {
            include orgEolang.eoMavenPlugin
            autoLayout lr
        }
        
        component orgEolang.eoMavenPlugin {
            include *
            autoLayout lr
        }

        styles {
            element "Application" {
                background "#0EEBE7"
            }
            
            element "File System" {
                shape "Folder"
                background "#6A5BEE"
                color "#FFFFFF"
            }
            
            element "Maven Goal" {
                background "#FFE733"
                color "#000000"
            }
            
            element "Maven plugin" {
                background "#FFE733"
                color "#000000"
            }
            
            element "Haskell module" {
                shape "Component"
                background "#ADEB0E"
            }
            
            element "Java package" {
                shape "Component"
                background "#ADEB0E"
            }
            
            element "Command" {
                shape "RoundedBox"
                background "#044B74"
                color "#FFFFFF"
            }
            
            element "Developer" {
                shape "Person"
                background "#09043F"
                color "#FFFFFF"
            }
        }
        
        properties {
            "structurizr.sort" "created"
        }
    }
}
