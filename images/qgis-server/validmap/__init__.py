from qgis.server import QgsServerFilter
import re
import os

PARAMETER = "MAP"
SUFFIX = ".qgs"
VALID_PATTERN = r"[-_a-z0-9]+"

PREFIX_DEFAULT = os.environ.get("PROJECT_PREFIX", "")
PREFIX_SECURE = os.environ.get("SECURED_PROJECT_PREFIX" , "")


class ValidmapFilter(QgsServerFilter):
    def __init__(self, serverIface):
        super().__init__(serverIface)
        serverIface.registerFilter(self, 100)

    def onRequestReady(self) -> bool:
        req = self.serverInterface().requestHandler()
        host = self.serverInterface().getEnv("SERVER_NAME")
        project_file = req.parameterMap().get(PARAMETER, "")
        
        if re.match(r"^qgis\..*", host):
            if re.fullmatch(VALID_PATTERN, project_file):
                # use good value with prefix and suffix
                req.setParameter(PARAMETER,
                             f"{PREFIX_DEFAULT}{project_file}/{project_file}{SUFFIX}")
            else:
                # reject bad value by removing it
                req.removeParameter(PARAMETER)
    
        elif re.match(r"^qgis-secure\..*", host):
            if re.fullmatch(VALID_PATTERN, project_file):
                req.setParameter(PARAMETER,
                             f"{PREFIX_SECURE}{project_file}/{project_file}{SUFFIX}")
            else:
                # reject bad value by removing it
                req.removeParameter(PARAMETER)
        
        return True


def serverClassFactory(serverIface):
    return ValidmapFilter(serverIface)
