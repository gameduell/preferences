/*
 * Copyright (c) 2003-2015 GameDuell GmbH, All Rights Reserved
 * This document is strictly confidential and sole property of GameDuell GmbH, Berlin, Germany
 */
package duell.build.plugin.library.preferences;

import haxe.io.Path;
import duell.build.objects.Configuration;
import duell.helpers.TemplateHelper;
import duell.objects.DuellLib;

/**
 * @author jxav
 */
class LibraryBuild
{
    public function new()
    {}

    public function postParse(): Void
    {
        // copy template in haxe code
        var libPath: String = DuellLib.getDuellLib("preferences").getPath();
        var exportPath: String = Path.join([Configuration.getData().OUTPUT, "haxe"]);
        var classSourcePath: String = Path.join([libPath, "template"]);

        TemplateHelper.recursiveCopyTemplatedFiles(classSourcePath, exportPath, Configuration.getData(), Configuration.getData().TEMPLATE_FUNCTIONS);
    }

    public function preBuild(): Void
    {}

    public function postBuild(): Void
    {}
}
