!constant IMPORTS "Imports"
!constant IMPLEMENTED_VIA "Implemented via"

// TODO 
// user supplies rules
// user creates atoms

workspace {

    !identifiers hierarchical

    model {
                    
        filesystem = softwareSystem "Files" {
            description "Stores files."
            
            tags "Files"
            
            group "User-supplied files" {
                normalizationRules = container "Normalization rules" {
                    description "Rules that specify transformations of PHI programs."
                    tags "Files"
                    technology "Files"
                }
            }
            
            group "Apache Maven JAR Plugin outputs" {
                javaCompilerOutput = container "jar:jar output" {
                    description "Java bytecode"
                    tags "Files"
                    technology "Files"
                }
            }
            
            group "Intermediate optimization outputs" {
                jeoDisassembleOutput = container "jeo:disassemble output" {
                    description "XMIR files"
                    tags "Files"
                    technology "Files"
                }
                opeoDecompileOutput = container "opeo:decompile output" {
                    description "XMIR files with high-level EO code"
                    tags "Files"
                    technology "Files"
                }
                eoPhiOutput = container "eo:phi output" {
                    description "PHI code"
                    tags "Files"
                    technology "Files"
                }
                normReduceOutput = container "norm:reduce output" {
                    description "PHI code"
                    tags "Files"
                    technology "Files"
                }
                ineoFuseOutput = container "ineo:fuse output" {
                    description "PHI code"
                    tags "Files"
                    technology "Files"
                }
                eoUnphiOutput = container "eo:unphi output" {
                    description "XMIR files with high-level EO code"
                    tags "Files"
                    technology "Files"
                }
                opeoCompileOutput = container "opeo:compile output" {
                    description "XMIR files with low-level EO code"
                    tags "Files"
                    technology "Files"
                }
                xmirToBytecodeOutput = container "jeo:xmir-to-bytecode output" {
                    description "Java bytecode"
                    tags "Files"
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
            -> filesystem "Uses"
        }
        
        normalizer = softwareSystem normalizer {
            description "Command-line normalizer of PHI code"
            tags "Application"
            
            modules = container "Haskell modules" {
                description "Main modules"
                tags "Haskell module"
                technology "Haskell modules"
                
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
                Language_EO_Phi_Atoms = component "Language.EO.Phi.Atoms.*" {
                    description "Definitions of atoms"
                    tags "Haskell module"
                    technology "Haskell modules"
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
            modules.Language_EO_Phi_Dataize -> modules.Language_EO_Phi_Atoms "${IMPORTS}"
            
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
                -> modules.Language_EO_Phi "${IMPLEMENTED_VIA}"
                -> modules.Language_EO_Phi_Metrics_Collect "${IMPLEMENTED_VIA}"
                -> modules.Language_EO_Phi_Metrics_Data "${IMPLEMENTED_VIA}"
            }
            transform = container transform {
                description "Rewrite PHI code to a normal form"
                technology "Command"
                tags "Command"
                
                -> modules.Main "Implemented in"
                -> modules.Language_EO_Phi "${IMPLEMENTED_VIA}"
                -> modules.Language_EO_Phi_Rules_Common "${IMPLEMENTED_VIA}"
                -> modules.Language_EO_Phi_Rules_Yaml "${IMPLEMENTED_VIA}"
            }
            dataize = container dataize {
                description "Dataize PHI code"
                technology "Command"
                tags "Command"
                
                -> modules.Main "Implemented in"
                -> modules.Language_EO_Phi "${IMPLEMENTED_VIA}"
                -> modules.Language_EO_Phi_Rules_Common "${IMPLEMENTED_VIA}"
                -> modules.Language_EO_Phi_Rules_Yaml "${IMPLEMENTED_VIA}"
                -> modules.Language_EO_Phi_Dataize "${IMPLEMENTED_VIA}"
            }
            report = container report {
                description "Generate a report for given PHI programs"
                technology "Command"
                tags "Command"
                
                -> modules.Main "Implemented in"
                -> modules.Language_EO_Phi "${IMPLEMENTED_VIA}"
                -> modules.Language_EO_Phi_Report_Data "${IMPLEMENTED_VIA}"
                -> modules.Language_EO_Phi_Report_Html "${IMPLEMENTED_VIA}"
            }
        }
        
        // TODO calls compiler with parameters using maven
        
        // TODO(presentation) why this tool?
        // why haskell

        
        optimizationPlugin = softwareSystem "Maven plugin for Java bytecode optimization" {
            description "Processes and optimizes Java bytecode."
            
            tags "Maven plugin"
            
            
            optimizationPluginUsesFilesystem = -> filesystem "Uses"
            optimizationPluginUsesNormalizer = -> normalizer "Uses"
            // Maven goals are denoted as containers because they're separately deployable.
            // E.g., one can run a part of the pipeline.
            // > Essentially, a container is a separately runnable/deployable unit (e.g. a separate process space) that executes code or stores data. - [link](https://c4model.com/)
            
            jeoDisassemble = container "jeo:disassemble" {
                description "Converts Java bytecode binary files to XMIR files with low-level EO code that has `opcode` atoms."
                technology "Maven goal"
                tags "Maven goal"
            }
      
            opeoDecompile = container "opeo:decompile" {
                description "Takes XMIR files with low-level EO code and transforms combinations of `opcode` atoms into EO objects. Produces XMIR files with high-level EO code."
                technology "Maven goal"
                tags "Maven goal"
            }
      
            eoPhi = container "eo:xmir-to-phi" {
                description "Converts XMIR files with high-level EO code to files with PHI code."
                technology "Maven goal"
                tags "Maven goal"
                
                -> orgEolang.eoMavenPlugin "Uses"
            }
            
            normReduce = container "norm:reduce" {
                description "Evaluates and rewrites PHI code."
                technology "Maven goal"
                tags "Maven goal"
                
                normalizerWrapper = component "Normalizer wrapper" {
                    technology "Java class"
                    tags "Java class"
                    
                    -> normalizer.dataize "Runs with arguments"
                }
            }
            
            ineoFuse = container "ineo:fuse" {
                description "Optimizes PHI code."
                technology "Maven goal"
                tags "Maven goal"
            }
            
            eoUnphi = container "eo:phi-to-xmir" {
                description "Converts PHI code to XMIR files with high-level EO code."
                technology "Maven goal"
                tags "Maven goal"
                
                -> orgEolang.eoMavenPlugin "Uses"
            }
                        
            opeoCompile = container "opeo:compile" {
                description "Converts XMIR files with high-level EO code to XMIR files with low-level EO code."
                technology "Maven goal"
                tags "Maven goal"
            }
            
            xmirToBytecode = container "jeo:xmir-to-bytecode" {
                description "Converts XMIR files with low-level EO code to Java bytecode."
                technology "Maven goal"
                tags "Maven goal"
            }
            

            // TODO
            // sets arguments for normalizer
            // writes files
            // TODO add "uses EO compiler"
            
            jeoDisassemble -> filesystem.javaCompilerOutput "Reads"
            jeoDisassemble -> filesystem.jeoDisassembleOutput "Writes"
            opeoDecompile -> filesystem.jeoDisassembleOutput "Reads"
            opeoDecompile -> filesystem.opeoDecompileOutput "Writes"
            eoPhi -> filesystem.opeoDecompileOutput "Reads"
            eoPhi -> filesystem.eoPhiOutput "Writes"
            normReduce -> filesystem.eoPhiOutput "Reads"
            normReduce -> filesystem.normReduceOutput "Writes"
            ineoFuse -> filesystem.normReduceOutput "Reads"
            ineoFuse -> filesystem.ineoFuseOutput "Writes"
            eoUnphi -> filesystem.ineoFuseOutput "Reads"
            eoUnphi -> filesystem.eoUnphiOutput "Writes"
            opeoCompile -> filesystem.eoUnphiOutput "Reads"
            opeoCompile -> filesystem.opeoCompileOutput "Writes"
            xmirToBytecode -> filesystem.opeoCompileOutput "Reads"
            xmirToBytecode -> filesystem.xmirToBytecodeOutput "Writes"
        }
          
        maven = softwareSystem "Maven" {
            description "Build tool for Java projects."

            tags "Application"
            
            -> optimizationPlugin "Executes"
        }
        
        javaDeveloper = person "Java developer" {
            description "Develops Java applications."
            tags "Developer"
            
            -> maven "Uses to build and optimize Java applications"
            -> filesystem "Writes rules for the normalizer to"
            -> normalizer "Optionally modifies"
            -> normalizer.modules.Language_EO_Phi_Atoms "Optionally adds atoms"
            -> normalizer.modules.Language_EO_Phi_Dataize "If added atoms, updates imports and functions"
        }
        
        normalizerDeveloper = person "Normalizer developer" {
            description "A developer in the Normalizer project."
            tags "Developer"
            
            -> normalizer "Develops"
            -> filesystem "Writes rules for the normalizer to"
            -> eoc "Uses"
            -> normalizer.report "Generates reports on tests via"
            -> normalizer.metrics "Collects metrics on a program via"
            -> normalizer.dataize "Dataizes programs via"
            -> normalizer.transform "Transforms programs via"
        }
                
        normalizer -> filesystem "Uses"
        
        normalizer.modules.Main -> filesystem.eoPhiOutput "Reads"
        normalizer.modules.Main -> filesystem.normReduceOutput "Writes" 
        normalizer.modules.Main -> filesystem.normalizationRules "Reads" 
        
        normalizer.metrics -> filesystem "Uses"
        normalizer.transform -> filesystem "Uses"
        normalizer.dataize -> filesystem "Uses"
        normalizer.report -> filesystem "Uses"
                
        optimizationPlugin.normReduce -> filesystem "Uses"
    }

    views {
        
        systemLandscape optimizationPluginCombined {
            title "Overview"
            
            include *
            include javaDeveloper
            include normalizerDeveloper
            
            exclude "optimizationPlugin -> filesystem"
            include optimizationPluginUsesFilesystem
            
            autoLayout lr
        }
        
        systemLandscape optimizationPluginJavaDeveloper {
            title "Java developer perspective"
            
            include *
            exclude normalizerDeveloper
            
            exclude "optimizationPlugin -> filesystem"
            include optimizationPluginUsesFilesystem
            
            exclude orgEolang
            exclude eoc
            
            autoLayout lr
        }
        
        systemLandscape optimizationPluginNormalizerDeveloper {
            title "Normalizer developer perspective"
            
            include *
            
            exclude "optimizationPlugin -> filesystem"
            include optimizationPluginUsesFilesystem
            
            exclude javaDeveloper
            exclude optimizationPlugin
            exclude maven
            exclude orgEolang
            
            
            autoLayout lr
        }
        
        systemContext optimizationPlugin {
            title "[System Context] Optimization plugin"
            
            include *
            
            exclude "optimizationPlugin -> filesystem"
            include optimizationPluginUsesFilesystem
            
            autoLayout lr
        }
        
        systemContext normalizer {
            title "[System Context] Normalizer"
            
            include filesystem
            include optimizationPlugin
            include normalizerDeveloper
            
            exclude "optimizationPlugin -> normalizer"
            exclude "optimizationPlugin -> filesystem"
            include optimizationPluginUsesFilesystem
            include optimizationPluginUsesNormalizer
            
            autoLayout lr
        }

        dynamic optimizationPlugin {
            title "Plugin workflow"
            
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
            optimizationPlugin.xmirToBytecode -> filesystem.xmirToBytecodeOutput "Writes"
            
            // TODO fix layout
                        
            autoLayout tb
        }
        
        
        component normalizer.dataize {
            include normalizer.modules.Main
            include normalizer.modules.Language_EO_Phi
            include normalizer.modules.Language_EO_Phi_Rules_Common
            include normalizer.modules.Language_EO_Phi_Rules_Yaml
            include normalizer.modules.Language_EO_Phi_Dataize
            include normalizer.modules.Language_EO_Phi_Atoms
            
            include javaDeveloper
            
            autoLayout lr
        }
                
        dynamic normalizer.dataize {
            title "Dataization workflow"
            
            normalizer.modules.Main -> filesystem.normalizationRules "Reads normalization rules from"
            normalizer.modules.Main -> normalizer.modules.Language_EO_Phi_Rules_Yaml "Parses rules via"
            normalizer.modules.Main -> filesystem.eoPhiOutput "Reads input programs from"
            normalizer.modules.Main -> normalizer.modules.Language_EO_Phi "Parses input programs via"
            normalizer.modules.Main -> normalizer.modules.Language_EO_Phi_Rules_Common "Applies rules via"
            normalizer.modules.Main -> normalizer.modules.Language_EO_Phi_Dataize "Dataizes via"
            normalizer.modules.Main -> filesystem.normReduceOutput "Writes output programs to"
            
            autoLayout tb
        }
        
        // Less important
        
        container optimizationPlugin {
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
            include filesystem.xmirToBytecodeOutput
            
            // TODO fix layout
            
            autoLayout tb
        }
        
        container normalizer {
            title "[Container] Normalizer developer perspective"
            
            include normalizer.transform
            include normalizer.metrics
            include normalizer.dataize
            include normalizer.report
            include filesystem
            include normalizerDeveloper
            
            exclude "normalizer.modules.Main -> filesystem.eoPhiOutput"
            exclude "normalizer.modules.Main -> filesystem.normReduceOutput"
            exclude "normalizer.modules.Main -> filesystem.normalizationRules"            
            include "optimizationPlugin.normReduce -> filesystem"
            
            autoLayout tb
        }
        
        container normalizer {
            title "[Container] norm:reduce perspective on Normalizer"
            
            include normalizer.dataize
            include filesystem
            include optimizationPlugin.normReduce
            
            exclude "normalizer.modules.Main -> filesystem.eoPhiOutput"
            exclude "normalizer.modules.Main -> filesystem.normReduceOutput"
            exclude "normalizer.modules.Main -> filesystem.normalizationRules"            
            exclude "optimizationPlugin.normReduce -> filesystem"
            
            autoLayout tb
        }
        
                
        component normalizer.modules {
            include *
            
            exclude normalizer.metrics
            exclude normalizer.report
            exclude normalizer.transform
            exclude normalizer.dataize
            exclude filesystem
            
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
            include normalizer
            include optimizationPlugin.normReduce.normalizerWrapper
            autoLayout lr
        }
        
        systemContext eoc {
            include *
            autoLayout lr
        }
        
        container eoc {
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
        
        systemContext filesystem {
            include *
            autoLayout lr
        }
        
        container filesystem {
            include *
            autoLayout lr
        }

        styles {
            element "Application" {
                background "#0EEBE7"
            }
            
            element "Files" {
                shape "Folder"
                background "#6A5BEE"
                color "#FFFFFF"
            }
            
            element "Maven goal" {
                background "#FFE733"
                color "#000000"
                shape Pipe
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
            
            element "Java class" {
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
