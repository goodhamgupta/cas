<%@ taglib uri="/struts-tags" prefix="webwork" %>
<webwork:if test="parameters['start'] != 0 || parameters['size'] > parameters['perPage']">
    <tfoot class="pager">
        <tr>
            <webwork:if test="parameters['start'] != 0">
                <td class="pager-previous" colspan="<webwork:if test="parameters['size'] > parameters['perPage']"><webwork:property value="(parameters['columns'] - 1)"/></webwork:if><webwork:else><webwork:property value="parameters['columns']"/></webwork:else>">
                    <a href="javascript: document.previous.submit()">&laquo; <webwork:property value="getText('previous.label')"/></a>
                </td>
            </webwork:if>
            <webwork:if test="parameters['size'] > parameters['perPage']">
                <td class="pager-next" colspan="<webwork:if test="parameters['start'] != 0">1</webwork:if><webwork:else><webwork:property value="parameters['columns']"/></webwork:else>">
                    <a href="javascript: document.next.submit()"><webwork:property value="getText('next.label')"/> &raquo;</a>
                </td>
            </webwork:if>
        </tr>
    </tfoot>
</webwork:if>
