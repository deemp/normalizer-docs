workspace {

    !identifiers hierarchical

    model {
        user = person "Developer" "Uses a Maven plugin for Java bytecode optimization."

        javaCompiler = softwareSystem "Java Compiler" {
            description "Compiles Java source code to bytecode."
            
        }
                    
        filesystem = softwareSystem "File System" {
            description "Stores files."
            
            group "Files" {
                !include filesystem.dsl
            }
        }
            
        optimizationPlugin = softwareSystem "Maven plugin for Java bytecode optimization" {
            description "Processes and optimizes Java bytecode."
            
            tags "File System"

            jeoBytecodeToXmir = container "jeo:bytecode-to-xmir" {
                description "Converts Java bytecode binary files to low-level EO code that use `opcode` atoms."
                technology "Maven goal"
            }
      
            opeoDecompile = container "opeo:decompile" {
                description "Transforms low-level EO programs to high-level EO programs."
                technology "Maven goal"
            }
      
            eoPhi = container "eo:phi" {
                description "Converts EO programs to PHI programs."
                technology "Maven goal"
            }
            
            normReduce = container "norm:reduce" {
                description "Evaluates and rewrites PHI programs."
                technology "Maven goal"
            }
            
            ineoFuse = container "ineo:fuse" {
                description "Additionally optimizes PHI programs."
                technology "Maven goal"
            }
            
            eoUnphi = container "eo:unphi" {
                description "Converts PHI programs to low-level EO programs."
                technology "Maven goal"
            }
                        
            opeoCompile = container "opeo:compile" {
                description "Converts low-level EO programs to high-level EO programs."
                technology "Maven goal"
            }
            
            xmirToBytecode = container "jeo:xmir-to-bytecode" {
                description "Converts EO programs to Java bytecode."
                technology "Maven goal"
            }
            
            group "Files" {
                !include filesystem.dsl
            }
            
            // TODO
            // sets arguments for normalizer
            // writes files
            // TODO add "uses EO compiler"
            
            jeoBytecodeToXmir -> jeoBytecodeToXmirOutput "Writes"
            opeoDecompile -> jeoBytecodeToXmirOutput "Reads"
            opeoDecompile -> opeoDecompileOutput "Writes"
            eoPhi -> opeoDecompileOutput "Reads"
            eoPhi -> eoPhiOutput "Writes"
            normReduce -> eoPhiOutput "Reads"
            normReduce -> normReduceOutput "Writes"
            ineoFuse -> normReduceOutput "Reads"
            ineoFuse -> ineoFuseOutput "Writes"
            eoUnphi -> ineoFuseOutput "Reads"
            eoUnphi -> eoUnphiOutput "Writes"
            opeoCompile -> eoUnphiOutput "Reads"
            opeoCompile -> opeoCompileOutput "Writes"
            xmirToBytecode -> opeoCompileOutput "Reads"
            xmirToBytecode -> xmirToBytecodeOutput "Writes"
        }
        
        user -> javaCompiler "Writes and builds Java code using Maven"    
    }

    views {
        systemContext optimizationPlugin {
            include *
            autolayout lr
        }

        container optimizationPlugin "Diagram1" {
            include *
            autolayout lr
        }
        
        container filesystem "Diagram2" {
            include ->filesystem->
            autolayout lr
        }

        // Additional views (Component, Dynamic, etc.) would be defined here.
        styles {
            element "File System" {
                shape "Folder"
            }
        }
    }

    // Add styling, layout hints, and documentation as needed.
}
