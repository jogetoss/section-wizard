<#if includeMetaData>
    <div class="form-cell" ${elementMetaData!}>
        <span class='form-floating-label'>SECTION WIZARD</span>
    </div>
<#else>
   <#if !(request.getAttribute("org.joget.plugin.SectionWizard")??) >
        <script type="text/javascript" src="${request.contextPath}/plugin/org.joget.plugin.SectionWizard/js/jquery.easyWizard.js"></script>
        <style type="text/css">
            .wizard > .easyWizardSteps {list-style:none;width:100%;overflow:hidden;margin:0;padding:0;border-bottom:1px solid #ccc;margin-bottom:20px}
            .wizard > .easyWizardSteps li {font-size:18px;display:inline-block;padding:10px;color:#B0B1B3;margin-right:20px;}
            .wizard > .easyWizardSteps li span {font-size:24px}
            .wizard > .easyWizardSteps li.current {color:#000; font-weight: bold;}
            .wizard > .easyWizardSteps li.error {color:red;}
            .wizard > .easyWizardWrapper > .step.active {visibility: unset !important}
            .wizard > .easyWizardWrapper > .step:not(.active) > .form-section-title {display: block !important;  padding: 1px;}
            .wizard > .easyWizardWrapper > .step:not(.active) > .form-column {display: none}
            .wizard > .easyWizardWrapper > .step:not(.active) > .subform-section-title {display: block !important; padding: 1px;}
            .wizard > .easyWizardWrapper > .step:not(.active) > .subform-column {display: none}
            .wizard > .easyWizardWrapper > .step{visibility: hidden;display:block !important; padding:0px !important; border:0px !important; clear: right !important; margin:0 !important; margin-top:0px !important; box-shadow:none !important; }
            .wizard > .easyWizardWrapperContainer > .easyWizardWrapper > .step_wrapper > .step{display:block !important; padding:0px !important;  margin:0 !important; margin-top:0px !important; box-shadow:none !important; clear: right !important; border: 0px !important;}
            .wizard > .easyWizardButtons {overflow:hidden;padding:10px;}
            .wizard > .easyWizardButtons button, .easyWizardButtons .submit {cursor:pointer}
            .wizard > .easyWizardButtons .prev {float:left}
            .wizard > .easyWizardButtons .next, .easyWizardButtons .submit {float:right}
            
            .wizard.rtl > .easyWizardSteps {direction:rtl}
            .wizard.rtl > .easyWizardSteps li {margin-right:0; margin-left:20px}
            .wizard.rtl > .easyWizardWrapper > .step {clear:left !important; float:right}
            .wizard.rtl > .easyWizardWrapperContainer > .easyWizardWrapper > .step_wrapper > .step {clear:left !important; float:right}
            .wizard.rtl > .easyWizardButtons .prev {float:right}
            .wizard.rtl > .easyWizardButtons .next, .wizard.rtl > .easyWizardButtons .submit {float:left}        
        </style>
    </#if>
    <div id="${elementParamName!}" class="wizard">
        <#list element.children as e>
            ${e.render(formData, includeMetaData!false)}
        </#list>
    </div>
    <script>
        $(document).ready(function(){
            var originalChange = VisibilityMonitor.prototype.triggerChange;

            VisibilityMonitor.prototype.triggerChange = function(targetEl, names) {
                originalChange(targetEl, names);
                $(targetEl).trigger("section-visibility-control-changed");
            };

            $("#${elementParamName!}").css("max-width", $("#${elementParamName!} .step").width() + "px");
            
            if (${rightToLeft?string}) {
             $("#${elementParamName!}").addClass("rtl");
             }            
            $("#${elementParamName!}").easyWizard({
                 submitButton: false,
                 clickableStep: '${element.properties.clickableStep!}',
                 rightToLeft: ${rightToLeft?string} // Pass the rightToLeft property


            });
        });
    </script>
</#if>
